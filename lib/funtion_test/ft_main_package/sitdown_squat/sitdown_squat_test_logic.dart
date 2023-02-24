import 'package:everex_function_test/funtion_test/test_logic_interface.dart';
import 'package:everex_function_test/funtion_test/util/evaluation_util.dart';
import 'package:everex_function_test/vo/pose_model_vo.dart';

class SitdownSquatLogic implements TestLogicInterface {
  int squatCount = 0;
  bool checkStart = false;
  bool checkEnd = false;

  @override
  fTest(PoseModelVo poseModelVo, int ftSectionIndex) {
    if (checkStart == false) {
      checkStartPose(poseModelVo);
    } else {
      checkEndPose(poseModelVo);
      if (checkEnd == true) {
        countUp();
      }
    }
  }

  @override
  reset() {
    squatCount = 0;
    checkStart = false;
    checkEnd = false;
  }

  @override
  bool readyFTest(PoseModelVo poseModelVo) {
    if (poseModelVo.head!.x > 25 &&
        poseModelVo.head!.x < 35 &&
        poseModelVo.rightTiptoe!.y < 80 &&
        poseModelVo.rightTiptoe!.y > 40 &&
        poseModelVo.leftTiptoe!.y > 40 &&
        poseModelVo.leftTiptoe!.y < 80) {
      return true;
    } else {
      return false;
    }
  }

  checkStartPose(
    PoseModelVo poseModelVo,
  ) {
    try {
      bool isLeftStart = false;
      bool isRightStart = false;

      PosePoint lp =
          PosePoint(poseModelVo.leftPelvis!.x, poseModelVo.leftPelvis!.y);
      PosePoint lk =
          PosePoint(poseModelVo.leftKnee!.x, poseModelVo.leftKnee!.y);
      PosePoint la =
          PosePoint(poseModelVo.leftAnkle!.x, poseModelVo.leftAnkle!.y);

      double leftAngle = get2DAngle(lp, lk, la);

      PosePoint rp =
          PosePoint(poseModelVo.rightPelvis!.x, poseModelVo.rightPelvis!.y);
      PosePoint rk =
          PosePoint(poseModelVo.rightKnee!.x, poseModelVo.rightKnee!.y);
      PosePoint ra =
          PosePoint(poseModelVo.rightAnkle!.x, poseModelVo.rightAnkle!.y);

      double rightAngle = get2DAngle(rp, rk, ra);

      if (leftAngle <= START_CONDITION_ANGLE) {
        isLeftStart = true;
      }
      if (rightAngle <= START_CONDITION_ANGLE) {
        isRightStart = true;
      }

      checkStart = isLeftStart;
    } catch (e) {
      print(e);
    }
  }

  checkEndPose(
    PoseModelVo poseModelVo,
  ) {
    try {
      bool isLeftEnd = false;
      bool isRightEnd = false;

      PosePoint lp =
          PosePoint(poseModelVo.leftPelvis!.x, poseModelVo.leftPelvis!.y);
      PosePoint lk =
          PosePoint(poseModelVo.leftKnee!.x, poseModelVo.leftKnee!.y);
      PosePoint la =
          PosePoint(poseModelVo.leftAnkle!.x, poseModelVo.leftAnkle!.y);

      double leftAngle = get2DAngle(lp, lk, la);

      PosePoint rp =
          PosePoint(poseModelVo.rightPelvis!.x, poseModelVo.rightPelvis!.y);
      PosePoint rk =
          PosePoint(poseModelVo.rightKnee!.x, poseModelVo.rightKnee!.y);
      PosePoint ra =
          PosePoint(poseModelVo.rightAnkle!.x, poseModelVo.rightAnkle!.y);

      double rightAngle = get2DAngle(rp, rk, ra);

      if (leftAngle >= END_CONDITION_ANGLE) {
        isLeftEnd = true;
      }
      if (rightAngle >= END_CONDITION_ANGLE) {
        isRightEnd = true;
      }

      checkEnd = isLeftEnd;
    } catch (e) {
      print(e);
    }
  }

  countUp() {
    squatCount++;
    checkEnd = false;
    checkStart = false;
  }
}

final ft7Logic = SitdownSquatLogic();
