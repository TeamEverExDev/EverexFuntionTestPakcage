import 'package:everex_function_test/funtion_test/util/evaluation_util.dart';
import 'package:everex_function_test/vo/pose_data_one_tick.dart';
import 'package:everex_function_test/vo/pose_model_vo.dart';

class SpreadArmLeftTestLogic {
  int finalLeftAngle = 0;
  int tempAngle = 0;

  fTest(PoseDataOneTick poseDataOneTick, int currentEvaluationShotId) {
    PosePoint ra;
    PosePoint rb;
    PosePoint rc;

    if (currentEvaluationShotId == 0) {
      ra = PosePoint(poseDataOneTick.poseModelVo.leftElbow!.x,
          poseDataOneTick.poseModelVo.leftElbow!.y);
      rb = PosePoint(poseDataOneTick.poseModelVo.leftShoulder!.x,
          poseDataOneTick.poseModelVo.leftShoulder!.y);
      rc = PosePoint(poseDataOneTick.poseModelVo.leftPelvis!.x,
          poseDataOneTick.poseModelVo.leftPelvis!.y);

      tempAngle = get2DAngle(ra, rb, rc).toInt();
      if (tempAngle <= 180 && tempAngle > finalLeftAngle) {
        finalLeftAngle = tempAngle;
      }
    }
  }
}
