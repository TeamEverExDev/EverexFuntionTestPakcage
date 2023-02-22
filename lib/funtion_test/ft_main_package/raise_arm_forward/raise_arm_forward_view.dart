import 'package:camera/camera.dart';
import 'package:everex_function_test/funtion_test/camera_and_draw/camera_view.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/raise_arm_forward/raise_arm_forward_test_logic.dart';
import 'package:everex_function_test/funtion_test/util/test_timer_and_score_widget.dart';
import 'package:flutter/material.dart';

import 'raise_arm_forward_procedure.dart';

class RaiseArmForwardView extends StatefulWidget {
  const RaiseArmForwardView(
      {Key? key, required this.cameraDescription, required this.modelAsset})
      : super(key: key);

  final CameraDescription cameraDescription;
  final String modelAsset;

  @override
  State<RaiseArmForwardView> createState() => _RaiseArmForwardViewState();
}

class _RaiseArmForwardViewState extends State<RaiseArmForwardView> {
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
                    remainSecond: ft3procedure.second,
                    resultTitle: '각도',
                    value: ft3procedure.progressGauge,
                    result: ft3Logic.finalAngle.toString(),
                    ftId: 3,
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
                          ftId: 3,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft3procedure.functionTestRun(poseModel);
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
                  ))
            ],
          ));
    }
  }
}
