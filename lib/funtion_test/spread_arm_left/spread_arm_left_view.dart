import 'package:camera/camera.dart';
import 'package:everex_function_test/funtion_test/camera_and_draw/camera_view.dart';
import 'package:flutter/material.dart';

class SpreadArmLeftView extends StatefulWidget {
  const SpreadArmLeftView(
      {Key? key, required this.cameraDescription, required this.modelAsset})
      : super(key: key);

  final CameraDescription cameraDescription;
  final String modelAsset;

  @override
  State<SpreadArmLeftView> createState() => _SpreadArmLeftViewState();
}

class _SpreadArmLeftViewState extends State<SpreadArmLeftView> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Orientation viewOrientation = MediaQuery.of(context).orientation;
    if (viewOrientation == Orientation.landscape) {
      return Scaffold(
          body: AspectRatio(
        aspectRatio: 4 / 3,
        child: mounted
            ? CameraView(
                cameraDescription: widget.cameraDescription,
                modelAsset: widget.modelAsset,
                ftId: 2,
              )
            : Container(),
      ));
    } else {
      return Scaffold(
          body: AspectRatio(
        aspectRatio: 3 / 4,
        child: mounted
            ? CameraView(
                cameraDescription: widget.cameraDescription,
                modelAsset: widget.modelAsset,
                ftId: 2,
              )
            : Container(),
      ));
    }
  }
}
