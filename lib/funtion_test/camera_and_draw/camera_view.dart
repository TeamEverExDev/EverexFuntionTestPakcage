import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:everex_function_test/controller/functon_test_controller.dart';
import 'package:everex_function_test/funtion_test/util/camera_view_size_cal.dart';
import 'package:everex_function_test/funtion_test/util/ftest_painter_selecter.dart';
import 'package:everex_function_test/util/after_layout_mix.dart';
import 'package:everex_tflite/everex_tflite.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:native_device_orientation/native_device_orientation.dart';

import '../../vo/pose_model_vo.dart';

class CameraView extends StatefulWidget {
  const CameraView({
    Key? key,
    required this.cameraDescription,
    required this.modelAsset,
    required this.ftId,
  }) : super(key: key);

  final CameraDescription cameraDescription;
  final String modelAsset;
  final int ftId;

  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> with AfterLayoutMixin {
  CameraController? _controller;
  bool completeLoadCamera = false;
  XFile? imageFile;
  bool uploadData = false;

  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = _controller;
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }
    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      onNewCameraSelected(cameraController.description);
    }
  }

  Future<void> onNewCameraSelected(CameraDescription cameraDescription) async {
    final CameraController? oldController = _controller;
    if (oldController != null) {
      _controller = null;
      await oldController.dispose();
    }
  }

  @override
  void initState() {
    super.initState();
    //EverexTflite.loadModel("assets/tflite/model_optimized.tflite");
    EverexTflite.loadModel(widget.modelAsset);
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    await _startLiveFeed(widget.cameraDescription);
  }

  @override
  void dispose() {
    super.dispose();
    EverexTflite.close();
    _stopLiveFeed();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Orientation viewOrientation = MediaQuery.of(context).orientation;
    print("ss");
    print(width);
    print(height);

    if (viewOrientation == Orientation.landscape) {
      width = cameraViewSizeCal(height, true);
    } else {
      height = cameraViewSizeCal(width, false);
    }

    return WillPopScope(
      onWillPop: () {
        return Future(() => true); //뒤로가기 허용
      },
      child: Scaffold(
        body: completeLoadCamera
            ? _body(width: width, height: height)
            : Container(),
      ),
    );
  }

  Widget _body({required double width, required double height}) {
    Widget body;
    body = _liveFeedBody(width: width, height: height);
    return body;
  }

  Widget _liveFeedBody({required double width, required double height}) {
    return Transform.scale(
      scale: 1,
      alignment: Alignment.topCenter,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          mounted ? CameraPreview(_controller!) : Container(),
          StreamBuilder<PoseModelVo?>(
            stream: functionTestStream.poseData,
            builder:
                (BuildContext context, AsyncSnapshot<PoseModelVo?> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  if (snapshot.data!.centerPelvis != null) {
                    final painter = ftestPainterSelect(
                        width, height, snapshot.data!, widget.ftId);
                    return CustomPaint(painter: painter);
                  } else {
                    return Container();
                  }
                } else {
                  return Container();
                }
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  Future _startLiveFeed(CameraDescription camera) async {
    _controller = CameraController(camera, ResolutionPreset.low,
        enableAudio: false,
        imageFormatGroup: Platform.isAndroid
            ? ImageFormatGroup.yuv420
            : ImageFormatGroup.bgra8888);

    await _controller!.initialize();
    _controller?.startImageStream(_processCameraImage);
    completeLoadCamera = true;
    setState(() {});
  }

  Future _stopLiveFeed() async {
    await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;
  }

  bool busy = false;

  Future _processCameraImage(CameraImage image) async {
    try {
      //320 * 240;
      NativeDeviceOrientation orientation =
          await NativeDeviceOrientationCommunicator()
              .orientation(useSensor: false);
      List<int> strides = Int32List(image.planes.length * 2);
      if (Platform.isAndroid) {
        int index = 0;
        image.planes.map((plane) {
          strides[index] = (plane.bytesPerRow);
          index++;
          strides[index] = (plane.bytesPerPixel)!;
          index++;
          return plane.bytes;
        }).toList();
      }

      if (busy == false) {
        busy = true;

        bool? runComplete = await EverexTflite.runModel(
            imageRotationDegree: _controller!.description.sensorOrientation,
            cameraLensDirection: _controller!.description.lensDirection.name,
            deviceOrientation: orientation.name,
            imageHeight: image.height,
            imageWidth: image.width,
            strides: strides,
            bytesList: image.planes.map((Plane plane) => plane.bytes).toList());

        if (runComplete ?? false) {
          List<double>? result = await EverexTflite.outPut();
          functionTestStream.setPoseData(PoseModelVo.fromList(result ?? []));
        }

        busy = false;
      } else {}
    } catch (e) {
      print(e);
    }
  }
}
