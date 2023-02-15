import 'package:camera/camera.dart';
import 'package:everex_function_test/funtion_test/camera_and_draw/camera_view.dart';
import 'package:everex_function_test/funtion_test/spread_arm_left/spread_arm_left_procedure.dart';
import 'package:everex_function_test/funtion_test/spread_arm_left/spread_arm_left_test_logic.dart';
import 'package:everex_function_test/funtion_test/util/test_timer_and_score_widget.dart';
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
  void initState() {
    super.initState();
    ft1procedure.setInit();
  }

  @override
  void dispose() {
    super.dispose();
    ft1procedure.clear();
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
                          ftId: 2,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft1procedure.functionTestRun(poseModel);
                            if (complete) {
                              Navigator.of(context).pop();
                            }
                          },
                        )
                      : Container(),
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: TestTimerAndScoreWidget(
                    remainSecond: ft1procedure.second,
                    resultTitle: '각도',
                    value: ft1procedure.progressGauge,
                    result: ft1Logic.finalLeftAngle.toString(),
                    ftId: 2,
                  ))
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
                          ftId: 2,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft1procedure.functionTestRun(poseModel);
                            if (complete) {
                              Navigator.of(context).pop();
                            }
                          },
                        )
                      : Container(),
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: TestTimerAndScoreWidget(
                    remainSecond: ft1procedure.second,
                    resultTitle: '각도',
                    value: ft1procedure.progressGauge,
                    result: ft1Logic.finalLeftAngle.toString(),
                    ftId: 2,
                  ))
            ],
          ));
    }
  }
}
