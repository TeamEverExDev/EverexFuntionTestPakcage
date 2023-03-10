import 'package:camera/camera.dart';
import 'package:everex_function_test/funtion_test/camera_and_draw/camera_view.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/spread_arm_left/spread_arm_left_procedure.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/spread_arm_left/spread_arm_left_test_logic.dart';
import 'package:everex_function_test/funtion_test/util/ready_timer_widget.dart';
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
  bool alreadyComplete = false;

  @override
  void initState() {
    super.initState();
    ft2procedure.setInit();
  }

  @override
  void dispose() {
    super.dispose();
    ft2procedure.clear();
  }

  @override
  Widget build(BuildContext context) {
    Orientation viewOrientation = MediaQuery.of(context).orientation;
    if (viewOrientation == Orientation.landscape) {
      return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Positioned(
                right: 24,
                top: 24,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
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
                                ft2procedure.functionTestRun(poseModel);
                            setState(() {});
                            if (complete && alreadyComplete == false) {
                              alreadyComplete = true;
                              Navigator.of(context).pop(ft2Logic.result);
                              ft2Logic.resetResult();
                            }
                          },
                        )
                      : Container(),
                ),
              ),
              ft2procedure.completeReady
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: TestTimerAndScoreWidget(
                        remainSecond: ft2procedure.second,
                        resultTitle: '??????',
                        value: ft2procedure.progressGauge,
                        result: ft2Logic.finalLeftAngle.toString(),
                        ftId: 2,
                      ))
                  : ReadyTimerWidget(
                      second: ft2procedure.second.toInt(), ftId: 2)
            ],
          ));
    } else {
      return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              Positioned(
                right: 24,
                top: 24,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
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
                                ft2procedure.functionTestRun(poseModel);
                            setState(() {});
                            if (complete && alreadyComplete == false) {
                              alreadyComplete = true;
                              Navigator.of(context).pop(ft2Logic.result);
                              ft2Logic.resetResult();
                            }
                          },
                        )
                      : Container(),
                ),
              ),
              ft2procedure.completeReady
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: TestTimerAndScoreWidget(
                        remainSecond: ft2procedure.second,
                        resultTitle: '??????',
                        value: ft2procedure.progressGauge,
                        result: ft2Logic.finalLeftAngle.toString(),
                        ftId: 2,
                      ))
                  : ReadyTimerWidget(
                      second: ft2procedure.second.toInt(), ftId: 2)
            ],
          ));
    }
  }
}
