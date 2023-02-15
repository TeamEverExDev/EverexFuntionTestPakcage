import 'package:everex_function_test/funtion_test/util/evaluation_util.dart';
import 'package:everex_function_test/vo/pose_model_vo.dart';

class SpreadArmLeftTestLogic {
  int finalLeftAngle = 0;
  int tempAngle = 0;

  fTest(PoseModelVo poseModelVo, int ftSectionIndex) {
    PosePoint ra;
    PosePoint rb;
    PosePoint rc;

    if (ftSectionIndex == 0) {
      ra = PosePoint(poseModelVo.leftElbow!.x, poseModelVo.leftElbow!.y);
      rb = PosePoint(poseModelVo.leftShoulder!.x, poseModelVo.leftShoulder!.y);
      rc = PosePoint(poseModelVo.leftPelvis!.x, poseModelVo.leftPelvis!.y);

      tempAngle = get2DAngle(ra, rb, rc).toInt();
      if (tempAngle <= 180 && tempAngle > finalLeftAngle) {
        finalLeftAngle = tempAngle;
      }
    }
  }

  reset() {
    finalLeftAngle = 0;
    tempAngle = 0;
  }
}

final ft1Logic = SpreadArmLeftTestLogic();
