import 'package:everex_function_test/vo/pose_model_vo.dart';
import 'package:rxdart/rxdart.dart';

class FunctionTestController {
  final BehaviorSubject<PoseModelVo?> poseData =
      BehaviorSubject<PoseModelVo?>();

  double width = 480;
  double height = 1200;

  close() {
    poseData.close();
  }

  setPoseData(PoseModelVo? poseModelVo) {
    poseData.sink.add(poseModelVo);
  }

  clearPoseData() {
    poseData.sink.close();
  }
}

final functionTestStream = FunctionTestController();
