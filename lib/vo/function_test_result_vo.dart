import 'package:everex_function_test/vo/pose_data_one_tick.dart';

class FunctionTestResultVo {
  late int id;
  late int score;
  Map<String, int> targetAngle = <String, int>{};
  Map<int, List<PoseDataOneTick>> pointData = <int, List<PoseDataOneTick>>{};

  FunctionTestResultVo(
      {required this.id,
      required this.score,
      required this.targetAngle,
      required this.pointData});
}
