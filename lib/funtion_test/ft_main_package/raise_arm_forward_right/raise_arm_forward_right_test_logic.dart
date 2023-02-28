import 'package:everex_function_test/funtion_test/test_logic_interface.dart';
import 'package:everex_function_test/funtion_test/util/evaluation_util.dart';
import 'package:everex_function_test/vo/pose_model_vo.dart';

class RaiseArmForwardRightTestLogic implements TestLogicInterface {
  int finalAngle = 0;
  int tempAngle = 0;

  @override
  int? result;

  @override
  fTest(PoseModelVo poseModelVo, int ftSectionIndex) {
    try {
      PosePoint la;
      PosePoint lb;
      PosePoint lc;

      PosePoint ra;
      PosePoint rb;
      PosePoint rc;

      if (ftSectionIndex == 0) {
        la = PosePoint(poseModelVo.leftElbow!.x, poseModelVo.leftElbow!.y);
        lb =
            PosePoint(poseModelVo.leftShoulder!.x, poseModelVo.leftShoulder!.y);
        lc = PosePoint(poseModelVo.leftPelvis!.x, poseModelVo.leftPelvis!.y);

        tempAngle = get2DAngle(la, lb, lc).toInt();
        if (tempAngle <= 180 && tempAngle > finalAngle) {
          finalAngle = tempAngle;
        }

        ra = PosePoint(poseModelVo.rightElbow!.x, poseModelVo.rightElbow!.y);
        rb = PosePoint(
            poseModelVo.rightShoulder!.x, poseModelVo.rightShoulder!.y);
        rc = PosePoint(poseModelVo.rightPelvis!.x, poseModelVo.rightPelvis!.y);

        tempAngle = get2DAngle(ra, rb, rc).toInt();
        if (tempAngle <= 180 && tempAngle > finalAngle) {
          finalAngle = tempAngle;
          result = finalAngle;
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  reset() {
    finalAngle = 0;
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
        poseModelVo.rightTiptoe!.y < 80 &&
        poseModelVo.leftTiptoe!.y < 80) {
      return true;
    } else {
      return false;
    }
  }
}

final ft3Logic = RaiseArmForwardRightTestLogic();
