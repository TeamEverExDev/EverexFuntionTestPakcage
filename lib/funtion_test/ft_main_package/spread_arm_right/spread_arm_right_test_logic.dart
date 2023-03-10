import 'package:everex_function_test/funtion_test/test_logic_interface.dart';
import 'package:everex_function_test/funtion_test/util/evaluation_util.dart';
import 'package:everex_function_test/vo/pose_model_vo.dart';

class SpreadArmRightTestLogic implements TestLogicInterface {
  int finalRightAngle = 0;

  @override
  int? result;

  int tempAngle = 0;

  @override
  fTest(PoseModelVo poseModelVo, int ftSectionIndex) {
    try {
      PosePoint ra;
      PosePoint rb;
      PosePoint rc;

      if (ftSectionIndex == 1) {
        ra = PosePoint(poseModelVo.rightElbow!.x, poseModelVo.rightElbow!.y);
        rb = PosePoint(
            poseModelVo.rightShoulder!.x, poseModelVo.rightShoulder!.y);
        rc = PosePoint(poseModelVo.rightPelvis!.x, poseModelVo.rightPelvis!.y);

        tempAngle = get2DAngle(ra, rb, rc).toInt();
        if (tempAngle <= 180 && tempAngle > finalRightAngle) {
          finalRightAngle = tempAngle;
          result = finalRightAngle;
        }
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
        poseModelVo.rightTiptoe!.y < 80 &&
        poseModelVo.rightTiptoe!.y > 40 &&
        poseModelVo.leftTiptoe!.y > 40 &&
        poseModelVo.leftTiptoe!.y < 80) {
      return true;
    } else {
      return false;
    }
  }
}

final ft1Logic = SpreadArmRightTestLogic();
