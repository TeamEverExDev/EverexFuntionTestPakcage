import 'package:everex_function_test/funtion_test/test_logic_interface.dart';
import 'package:everex_function_test/funtion_test/util/evaluation_util.dart';
import 'package:everex_function_test/vo/pose_model_vo.dart';

class SitdownAndBenKneeTestRightLogic implements TestLogicInterface {
  int tempAngle = 0;
  int finalRightAngle = 0;

  @override
  int? result;

  @override
  fTest(PoseModelVo poseModelVo, int ftSectionIndex) {
    try {
      PosePoint a =
          PosePoint(poseModelVo.rightPelvis!.x, poseModelVo.rightPelvis!.y);
      PosePoint b =
          PosePoint(poseModelVo.rightKnee!.x, poseModelVo.rightKnee!.y);
      PosePoint c =
          PosePoint(poseModelVo.rightAnkle!.x, poseModelVo.rightAnkle!.y);

      double rightAngle = get2DAngle(a, b, c);

      tempAngle = 180 - rightAngle.toInt();

      if (tempAngle <= 180 && tempAngle > finalRightAngle) {
        finalRightAngle = tempAngle;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  reset() {
    finalRightAngle = 0;
    tempAngle = 0;
  }

  @override
  resetResult() {
    result = null;
  }

  @override
  bool readyFTest(PoseModelVo poseModelVo) {
    if (poseModelVo.head!.x > 25 &&
        poseModelVo.head!.x < 35 &&
        poseModelVo.head!.y > 30 &&
        poseModelVo.rightTiptoe!.y < 80 &&
        poseModelVo.leftTiptoe!.y < 80) {
      return true;
    } else {
      return false;
    }
  }
}

final ft5Logic = SitdownAndBenKneeTestRightLogic();
