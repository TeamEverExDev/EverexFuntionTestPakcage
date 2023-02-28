import 'package:everex_function_test/vo/pose_model_vo.dart';

abstract class TestLogicInterface {
  int? result;

  fTest(PoseModelVo poseModelVo, int ftSectionIndex);

  reset();

  bool readyFTest(PoseModelVo poseModelVo);

  resetResult();
}
