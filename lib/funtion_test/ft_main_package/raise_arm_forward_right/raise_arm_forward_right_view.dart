import 'package:camera/camera.dart';
import 'package:everex_function_test/funtion_test/camera_and_draw/camera_view.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/raise_arm_forward_right/raise_arm_forward_right_test_logic.dart';
import 'package:everex_function_test/funtion_test/util/ready_timer_widget.dart';
import 'package:everex_function_test/funtion_test/util/test_timer_and_score_widget.dart';
import 'package:flutter/material.dart';

import 'raise_arm_forward_right_procedure.dart';

class RaiseArmForwardRightView extends StatefulWidget {
  const RaiseArmForwardRightView(
      {Key? key, required this.cameraDescription, required this.modelAsset})
      : super(key: key);

  final CameraDescription cameraDescription;
  final String modelAsset;

  @override
  State<RaiseArmForwardRightView> createState() =>
      _RaiseArmForwardRightViewState();
}

class _RaiseArmForwardRightViewState extends State<RaiseArmForwardRightView> {
  bool alreadyComplete = false;

  @override
  void initState() {
    super.initState();
    ft3procedure.setInit();
  }

  @override
  void dispose() {
    super.dispose();
    ft3procedure.clear();
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
                          ftId: 3,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft3procedure.functionTestRun(poseModel);
                            setState(() {});
                            if (complete && alreadyComplete == false) {
                              alreadyComplete = true;
                              Navigator.of(context).pop(ft3Logic.result);
                              ft3Logic.resetResult();
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
                    remainSecond: ft3procedure.second,
                    resultTitle: '각도',
                    value: ft3procedure.progressGauge,
                    result: ft3Logic.finalAngle.toString(),
                    ftId: 3,
                  )),
              ft3procedure.completeReady
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: TestTimerAndScoreWidget(
                        remainSecond: ft3procedure.second,
                        resultTitle: '각도',
                        value: ft3procedure.progressGauge,
                        result: ft3Logic.finalAngle.toString(),
                        ftId: 3,
                      ))
                  : ReadyTimerWidget(
                      second: ft3procedure.second.toInt(), ftId: 3)
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
                          ftId: 3,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft3procedure.functionTestRun(poseModel);
                            setState(() {});
                            if (complete && alreadyComplete == false) {
                              alreadyComplete = true;
                              Navigator.of(context).pop(ft3Logic.result);
                              ft3Logic.resetResult();
                            }
                          },
                        )
                      : Container(),
                ),
              ),
              ft3procedure.completeReady
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: TestTimerAndScoreWidget(
                        remainSecond: ft3procedure.second,
                        resultTitle: '각도',
                        value: ft3procedure.progressGauge,
                        result: ft3Logic.finalAngle.toString(),
                        ftId: 3,
                      ))
                  : ReadyTimerWidget(
                      second: ft3procedure.second.toInt(), ftId: 3)
            ],
          ));
    }
  }
}
