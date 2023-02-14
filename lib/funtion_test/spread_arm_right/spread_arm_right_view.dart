import 'package:camera/camera.dart';
import 'package:everex_function_test/funtion_test/camera_and_draw/camera_view.dart';
import 'package:flutter/material.dart';

class SpreadArmRightView extends StatefulWidget {
  const SpreadArmRightView(
      {Key? key, required this.cameraDescription, required this.modelAsset})
      : super(key: key);

  final CameraDescription cameraDescription;
  final String modelAsset;

  @override
  State<SpreadArmRightView> createState() => _SpreadArmRightViewState();
}

class _SpreadArmRightViewState extends State<SpreadArmRightView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    print("kk");
    print(width);
    print(height);

    Orientation viewOrientation = MediaQuery.of(context).orientation;
    if (viewOrientation == Orientation.landscape) {
      return Scaffold(
          body: Center(
        child: AspectRatio(
          aspectRatio: 4 / 3,
          child: mounted
              ? CameraView(
                  cameraDescription: widget.cameraDescription,
                  modelAsset: widget.modelAsset,
                )
              : Container(),
        ),
      ));
    } else {
      return Scaffold(
          body: Center(
        child: AspectRatio(
          aspectRatio: 3 / 4,
          child: mounted
              ? CameraView(
                  cameraDescription: widget.cameraDescription,
                  modelAsset: widget.modelAsset,
                )
              : Container(),
        ),
      ));
    }
  }
}
