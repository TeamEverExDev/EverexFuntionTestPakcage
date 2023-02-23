import 'package:camera/camera.dart';
import 'package:everex_function_test/funtion_test/camera_and_draw/camera_view.dart';
import 'package:everex_function_test/funtion_test/util/ready_timer_widget.dart';
import 'package:everex_function_test/funtion_test/util/test_timer_and_score_widget.dart';
import 'package:flutter/material.dart';

import 'oneleg_squat_left_procedure.dart';
import 'oneleg_squat_left_test_logic.dart';

class OnelegSquatLeftView extends StatefulWidget {
  const OnelegSquatLeftView(
      {Key? key, required this.cameraDescription, required this.modelAsset})
      : super(key: key);

  final CameraDescription cameraDescription;
  final String modelAsset;

  @override
  State<OnelegSquatLeftView> createState() => _OnelegSquatLeftViewState();
}

class _OnelegSquatLeftViewState extends State<OnelegSquatLeftView> {
  bool alreadyComplete = false;

  @override
  void initState() {
    super.initState();
    ft9procedure.setInit();
  }

  @override
  void dispose() {
    super.dispose();
    ft9procedure.clear();
  }

  @override
  Widget build(BuildContext context) {
    Orientation viewOrientation = MediaQuery.of(context).orientation;
    if (viewOrientation == Orientation.landscape) {
      return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: 4 / 3,
                  child: mounted
                      ? CameraView(
                          cameraDescription: widget.cameraDescription,
                          modelAsset: widget.modelAsset,
                          ftId: 9,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft9procedure.functionTestRun(poseModel);
                            setState(() {});
                            if (complete && alreadyComplete == false) {
                              alreadyComplete = true;
                              Navigator.of(context).pop();
                            }
                          },
                        )
                      : Container(),
                ),
              ),
              ft9procedure.completeReady
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: TestTimerAndScoreWidget(
                        remainSecond: ft9procedure.second,
                        resultTitle: '각도',
                        value: ft9procedure.progressGauge,
                        result: ft9Logic.currentScore.toString(),
                        ftId: 9,
                      ))
                  : ReadyTimerWidget(
                      second: ft9procedure.second.toInt(), ftId: 9)
            ],
          ));
    } else {
      return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: mounted
                      ? CameraView(
                          cameraDescription: widget.cameraDescription,
                          modelAsset: widget.modelAsset,
                          ftId: 9,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft9procedure.functionTestRun(poseModel);
                            setState(() {});
                            if (complete && alreadyComplete == false) {
                              alreadyComplete = true;
                              Navigator.of(context).pop();
                            }
                          },
                        )
                      : Container(),
                ),
              ),
              ft9procedure.completeReady
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: TestTimerAndScoreWidget(
                        remainSecond: ft9procedure.second,
                        resultTitle: '점수',
                        value: ft9procedure.progressGauge,
                        result: ft9Logic.currentScore.toString(),
                        ftId: 9,
                      ))
                  : ReadyTimerWidget(
                      second: ft9procedure.second.toInt(), ftId: 9)
            ],
          ));
    }
  }
}
