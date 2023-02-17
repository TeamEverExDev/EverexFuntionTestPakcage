import 'package:everex_function_test/funtion_test/test_logic_interface.dart';
import 'package:everex_function_test/funtion_test/util/evaluation_util.dart';
import 'package:everex_function_test/vo/pose_model_vo.dart';

class SpreadArmLeftTestLogic implements TestLogicInterface {
  int finalLeftAngle = 0;
  int tempAngle = 0;

  @override
  fTest(PoseModelVo poseModelVo, int ftSectionIndex) {
    try {
      PosePoint la;
      PosePoint lb;
      PosePoint lc;

      if (ftSectionIndex == 0) {
        la = PosePoint(poseModelVo.leftElbow!.x, poseModelVo.leftElbow!.y);
        lb =
            PosePoint(poseModelVo.leftShoulder!.x, poseModelVo.leftShoulder!.y);
        lc = PosePoint(poseModelVo.leftPelvis!.x, poseModelVo.leftPelvis!.y);

        tempAngle = get2DAngle(la, lb, lc).toInt();
        if (tempAngle <= 180 && tempAngle > finalLeftAngle) {
          finalLeftAngle = tempAngle;
        }
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
}

final ft2Logic = SpreadArmLeftTestLogic();
