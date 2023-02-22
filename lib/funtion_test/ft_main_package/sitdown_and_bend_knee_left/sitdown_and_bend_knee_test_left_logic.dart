import 'package:everex_function_test/funtion_test/test_logic_interface.dart';
import 'package:everex_function_test/funtion_test/util/evaluation_util.dart';
import 'package:everex_function_test/vo/pose_model_vo.dart';

class SitdownAndBenKneeTestLeftLogic implements TestLogicInterface {
  int tempAngle = 0;
  int finalLeftAngle = 0;

  @override
  fTest(PoseModelVo poseModelVo, int ftSectionIndex) {
    try {
      PosePoint a =
          PosePoint(poseModelVo.leftPelvis!.x, poseModelVo.leftPelvis!.y);
      PosePoint b = PosePoint(poseModelVo.leftKnee!.x, poseModelVo.leftKnee!.y);
      PosePoint c =
          PosePoint(poseModelVo.leftAnkle!.x, poseModelVo.leftAnkle!.y);

      double rightAngle = get2DAngle(a, b, c);

      tempAngle = 180 - rightAngle.toInt();

      if (tempAngle <= 180 && tempAngle > finalLeftAngle) {
        finalLeftAngle = tempAngle;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  reset() {
    finalLeftAngle = 0;
    tempAngle = 0;
  }

  @override
  bool readyFTest(PoseModelVo poseModelVo) {
    if (poseModelVo.head!.x > 25 &&
        poseModelVo.head!.x < 35 &&
        poseModelVo.rightTiptoe!.y < 80 &&
        poseModelVo.leftTiptoe!.y < 80) {
      return true;
    } else {
      return false;
    }
  }
}

final ft6Logic = SitdownAndBenKneeTestLeftLogic();
