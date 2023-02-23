import 'package:camera/camera.dart';
import 'package:everex_function_test/funtion_test/camera_and_draw/camera_view.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/sitdown_and_bend_knee_left/sitdown_and_bend_knee_left_procedure.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/sitdown_and_bend_knee_left/sitdown_and_bend_knee_test_left_logic.dart';
import 'package:everex_function_test/funtion_test/util/ready_timer_widget.dart';
import 'package:everex_function_test/funtion_test/util/test_timer_and_score_widget.dart';
import 'package:flutter/material.dart';

class SitdownAndBendKneeLeftView extends StatefulWidget {
  const SitdownAndBendKneeLeftView(
      {Key? key, required this.cameraDescription, required this.modelAsset})
      : super(key: key);

  final CameraDescription cameraDescription;
  final String modelAsset;

  @override
  State<SitdownAndBendKneeLeftView> createState() =>
      _SitdownAndBendKneeLeftViewState();
}

class _SitdownAndBendKneeLeftViewState
    extends State<SitdownAndBendKneeLeftView> {
  bool alreadyComplete = false;

  @override
  void initState() {
    super.initState();
    ft6procedure.setInit();
  }

  @override
  void dispose() {
    super.dispose();
    ft6procedure.clear();
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
                          ftId: 6,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft6procedure.functionTestRun(poseModel);
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
              ft6procedure.completeReady
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: TestTimerAndScoreWidget(
                        remainSecond: ft6procedure.second,
                        resultTitle: '각도',
                        value: ft6procedure.progressGauge,
                        result: ft6Logic.finalLeftAngle.toString(),
                        ftId: 6,
                      ))
                  : ReadyTimerWidget(
                      second: ft6procedure.second.toInt(), ftId: 6)
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
                          ftId: 6,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft6procedure.functionTestRun(poseModel);
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
              ft6procedure.completeReady
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: TestTimerAndScoreWidget(
                        remainSecond: ft6procedure.second,
                        resultTitle: '각도',
                        value: ft6procedure.progressGauge,
                        result: ft6Logic.finalLeftAngle.toString(),
                        ftId: 6,
                      ))
                  : ReadyTimerWidget(
                      second: ft6procedure.second.toInt(), ftId: 6)
            ],
          ));
    }
  }
}
