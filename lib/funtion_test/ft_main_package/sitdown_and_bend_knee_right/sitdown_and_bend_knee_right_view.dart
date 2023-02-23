import 'package:camera/camera.dart';
import 'package:everex_function_test/funtion_test/camera_and_draw/camera_view.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/sitdown_and_bend_knee_right/sitdown_and_bend_knee_right_procedure.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/sitdown_and_bend_knee_right/sitdown_and_bend_knee_test_right_logic.dart';
import 'package:everex_function_test/funtion_test/util/test_timer_and_score_widget.dart';
import 'package:flutter/material.dart';

class SitdownAndBendKneeRightView extends StatefulWidget {
  const SitdownAndBendKneeRightView(
      {Key? key, required this.cameraDescription, required this.modelAsset})
      : super(key: key);

  final CameraDescription cameraDescription;
  final String modelAsset;

  @override
  State<SitdownAndBendKneeRightView> createState() =>
      _SitdownAndBendKneeRightViewState();
}

class _SitdownAndBendKneeRightViewState
    extends State<SitdownAndBendKneeRightView> {
  bool alreadyComplete = false;

  @override
  void initState() {
    super.initState();
    ft5procedure.setInit();
  }

  @override
  void dispose() {
    super.dispose();
    ft5procedure.clear();
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
                          ftId: 5,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft5procedure.functionTestRun(poseModel);
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
                    remainSecond: ft5procedure.second,
                    resultTitle: '각도',
                    value: ft5procedure.progressGauge,
                    result: ft5Logic.finalRightAngle.toString(),
                    ftId: 5,
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
                          ftId: 5,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft5procedure.functionTestRun(poseModel);
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
                    remainSecond: ft5procedure.second,
                    resultTitle: '각도',
                    value: ft5procedure.progressGauge,
                    result: ft5Logic.finalRightAngle.toString(),
                    ftId: 5,
                  ))
            ],
          ));
    }
  }
}
