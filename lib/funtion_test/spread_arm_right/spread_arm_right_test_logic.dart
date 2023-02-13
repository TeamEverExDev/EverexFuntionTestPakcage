import 'package:everex_function_test/funtion_test/util/evaluation_util.dart';
import 'package:everex_function_test/vo/pose_data_one_tick.dart';
import 'package:everex_function_test/vo/pose_model_vo.dart';

class SpreadArmRightTestLogic {
  int finalRightAngle = 0;
  int tempAngle = 0;

  fTest(PoseDataOneTick poseDataOneTick, int currentEvaluationShotId) {
    PosePoint ra;
    PosePoint rb;
    PosePoint rc;

    if (currentEvaluationShotId == 0) {
      ra = PosePoint(poseDataOneTick.poseModelVo.rightElbow!.x,
          poseDataOneTick.poseModelVo.rightElbow!.y);
      rb = PosePoint(poseDataOneTick.poseModelVo.rightShoulder!.x,
          poseDataOneTick.poseModelVo.rightShoulder!.y);
      rc = PosePoint(poseDataOneTick.poseModelVo.rightPelvis!.x,
          poseDataOneTick.poseModelVo.rightPelvis!.y);

      tempAngle = get2DAngle(ra, rb, rc).toInt();
      if (tempAngle <= 180 && tempAngle > finalRightAngle) {
        finalRightAngle = tempAngle;
      }
    }
  }
}
