import 'package:camera/camera.dart';
import 'package:everex_function_test/funtion_test/camera_and_draw/camera_view.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/oneleg_squat_right/oneleg_squat_right_test_logic.dart';
import 'package:everex_function_test/funtion_test/util/ready_timer_widget.dart';
import 'package:everex_function_test/funtion_test/util/test_timer_and_score_widget.dart';
import 'package:flutter/material.dart';

import 'oneleg_squat_right_procedure.dart';

class OnelegSquatRightView extends StatefulWidget {
  const OnelegSquatRightView(
      {Key? key, required this.cameraDescription, required this.modelAsset})
      : super(key: key);

  final CameraDescription cameraDescription;
  final String modelAsset;

  @override
  State<OnelegSquatRightView> createState() => _OnelegSquatRightViewState();
}

class _OnelegSquatRightViewState extends State<OnelegSquatRightView> {
  bool alreadyComplete = false;

  @override
  void initState() {
    super.initState();
    ft8procedure.setInit();
  }

  @override
  void dispose() {
    super.dispose();
    ft8procedure.clear();
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
                          ftId: 8,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft8procedure.functionTestRun(poseModel);
                            setState(() {});
                            if (complete && alreadyComplete == false) {
                              alreadyComplete = true;
                              Navigator.of(context).pop(ft8Logic.result);
                              ft8Logic.resetResult();
                            }
                          },
                        )
                      : Container(),
                ),
              ),
              ft8procedure.completeReady
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: TestTimerAndScoreWidget(
                        remainSecond: ft8procedure.second,
                        resultTitle: '??????',
                        value: ft8procedure.progressGauge,
                        result: ft8Logic.currentScore.toString(),
                        ftId: 8,
                      ))
                  : ReadyTimerWidget(
                      second: ft8procedure.second.toInt(), ftId: 8)
            ],
          ));
    } else {
      return Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Positioned(
                  right: 24,
                  top: 24,
                  child: Icon(
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
                          ftId: 8,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft8procedure.functionTestRun(poseModel);
                            setState(() {});
                            if (complete && alreadyComplete == false) {
                              alreadyComplete = true;
                              Navigator.of(context).pop(ft8Logic.result);
                              ft8Logic.resetResult();
                            }
                          },
                        )
                      : Container(),
                ),
              ),
              ft8procedure.completeReady
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: TestTimerAndScoreWidget(
                        remainSecond: ft8procedure.second,
                        resultTitle: '??????',
                        value: ft8procedure.progressGauge,
                        result: ft8Logic.currentScore.toString(),
                        ftId: 8,
                      ))
                  : ReadyTimerWidget(
                      second: ft8procedure.second.toInt(), ftId: 8)
            ],
          ));
    }
  }
}
