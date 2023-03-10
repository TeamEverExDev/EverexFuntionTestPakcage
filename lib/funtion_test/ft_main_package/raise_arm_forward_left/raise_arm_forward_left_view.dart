import 'package:camera/camera.dart';
import 'package:everex_function_test/funtion_test/camera_and_draw/camera_view.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/raise_arm_forward_left/raise_arm_forward_left_test_logic.dart';
import 'package:everex_function_test/funtion_test/util/ready_timer_widget.dart';
import 'package:everex_function_test/funtion_test/util/test_timer_and_score_widget.dart';
import 'package:flutter/material.dart';

import 'raise_arm_forward_left_procedure.dart';

class RaiseArmForwardLeftView extends StatefulWidget {
  const RaiseArmForwardLeftView(
      {Key? key, required this.cameraDescription, required this.modelAsset})
      : super(key: key);

  final CameraDescription cameraDescription;
  final String modelAsset;

  @override
  State<RaiseArmForwardLeftView> createState() =>
      _RaiseArmForwardLeftViewState();
}

class _RaiseArmForwardLeftViewState extends State<RaiseArmForwardLeftView> {
  bool alreadyComplete = false;

  @override
  void initState() {
    super.initState();
    ft4procedure.setInit();
  }

  @override
  void dispose() {
    super.dispose();
    ft4procedure.clear();
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
                          ftId: 4,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft4procedure.functionTestRun(poseModel);
                            setState(() {});
                            if (complete && alreadyComplete == false) {
                              alreadyComplete = true;
                              Navigator.of(context).pop(ft4Logic.result);
                              ft4Logic.resetResult();
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
                    remainSecond: ft4procedure.second,
                    resultTitle: '??????',
                    value: ft4procedure.progressGauge,
                    result: ft4Logic.finalAngle.toString(),
                    ftId: 4,
                  )),
              ft4procedure.completeReady
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: TestTimerAndScoreWidget(
                        remainSecond: ft4procedure.second,
                        resultTitle: '??????',
                        value: ft4procedure.progressGauge,
                        result: ft4Logic.finalAngle.toString(),
                        ftId: 4,
                      ))
                  : ReadyTimerWidget(
                      second: ft4procedure.second.toInt(), ftId: 4)
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
                          ftId: 4,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft4procedure.functionTestRun(poseModel);
                            setState(() {});
                            if (complete && alreadyComplete == false) {
                              alreadyComplete = true;
                              Navigator.of(context).pop(ft4Logic.result);
                              ft4Logic.resetResult();
                            }
                          },
                        )
                      : Container(),
                ),
              ),
              ft4procedure.completeReady
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: TestTimerAndScoreWidget(
                        remainSecond: ft4procedure.second,
                        resultTitle: '??????',
                        value: ft4procedure.progressGauge,
                        result: ft4Logic.finalAngle.toString(),
                        ftId: 4,
                      ))
                  : ReadyTimerWidget(
                      second: ft4procedure.second.toInt(), ftId: 4)
            ],
          ));
    }
  }
}
