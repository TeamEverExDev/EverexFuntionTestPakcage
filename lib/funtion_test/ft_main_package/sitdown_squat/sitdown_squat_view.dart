import 'package:camera/camera.dart';
import 'package:everex_function_test/funtion_test/camera_and_draw/camera_view.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/sitdown_squat/sitdown_squat_test_logic.dart';
import 'package:everex_function_test/funtion_test/util/ready_timer_widget.dart';
import 'package:everex_function_test/funtion_test/util/test_timer_and_score_widget.dart';
import 'package:flutter/material.dart';

import 'sitdown_squat_procedure.dart';

class SitdownSquatView extends StatefulWidget {
  const SitdownSquatView(
      {Key? key, required this.cameraDescription, required this.modelAsset})
      : super(key: key);

  final CameraDescription cameraDescription;
  final String modelAsset;

  @override
  State<SitdownSquatView> createState() => _SitdownSquatViewState();
}

class _SitdownSquatViewState extends State<SitdownSquatView> {
  bool alreadyComplete = false;

  @override
  void initState() {
    super.initState();
    ft7procedure.setInit();
  }

  @override
  void dispose() {
    super.dispose();
    ft7procedure.clear();
  }

  @override
  Widget build(BuildContext context) {
    Orientation viewOrientation = MediaQuery.of(context).orientation;
    if (viewOrientation == Orientation.landscape) {
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
                  aspectRatio: 4 / 3,
                  child: mounted
                      ? CameraView(
                          cameraDescription: widget.cameraDescription,
                          modelAsset: widget.modelAsset,
                          ftId: 7,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft7procedure.functionTestRun(poseModel);
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
              ft7procedure.completeReady
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: TestTimerAndScoreWidget(
                        remainSecond: ft7procedure.second,
                        resultTitle: '개수',
                        value: ft7procedure.progressGauge,
                        result: ft7Logic.squatCount.toString(),
                        ftId: 7,
                      ))
                  : ReadyTimerWidget(
                      second: ft7procedure.second.toInt(), ftId: 7)
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
                          ftId: 7,
                          callBackPoseModel: (poseModel) {
                            bool complete =
                                ft7procedure.functionTestRun(poseModel);
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
              ft7procedure.completeReady
                  ? Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: TestTimerAndScoreWidget(
                        remainSecond: ft7procedure.second,
                        resultTitle: '개수',
                        value: ft7procedure.progressGauge,
                        result: ft7Logic.squatCount.toString(),
                        ftId: 7,
                      ))
                  : ReadyTimerWidget(
                      second: ft7procedure.second.toInt(), ftId: 7)
            ],
          ));
    }
  }
}
