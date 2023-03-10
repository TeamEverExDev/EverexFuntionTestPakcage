import 'package:everex_function_test/funtion_test/ft_main_package/spread_arm_left/spread_arm_left_test_logic.dart';
import 'package:everex_function_test/funtion_test/procedure_interface.dart';
import 'package:everex_function_test/vo/function_test_section_model.dart';
import 'package:everex_function_test/vo/pose_data_one_tick.dart';
import 'package:everex_function_test/vo/pose_model_vo.dart';

class SpreadArmLeftProcedure implements ProcedureInterface {
  List<FunctionTestSectionModel> fullSet = <FunctionTestSectionModel>[];
  List<PoseDataOneTick> poseDataOneTicks = <PoseDataOneTick>[];
  Map<int, List<PoseDataOneTick>> resultMap = <int, List<PoseDataOneTick>>{};
  int nextIndex = 0;
  DateTime startDate = DateTime.now();
  double second = 0;
  double progressGauge = 0;
  bool tempReady = false;
  bool completeReady = false;

  @override
  setInit() {
    fullSet.add(FunctionTestSectionModel(
        index: 0, second: 5, done: false, active: true, imageAsset: ''));
    fullSet.add(FunctionTestSectionModel(
        index: 1, second: 15, done: false, active: true, imageAsset: ''));
    fullSet.add(FunctionTestSectionModel(
        index: 2, second: -1, done: false, active: false, imageAsset: ''));
    ft2Logic.reset();
  }

  @override
  reset() {
    fullSet.clear();
    fullSet.add(FunctionTestSectionModel(
        index: 0, second: 5, done: false, active: true, imageAsset: ''));
    fullSet.add(FunctionTestSectionModel(
        index: 1, second: 15, done: false, active: true, imageAsset: ''));
    fullSet.add(FunctionTestSectionModel(
        index: 2, second: -1, done: false, active: false, imageAsset: ''));
    poseDataOneTicks.clear();
    resultMap.clear();
    nextIndex = 0;
    startDate = DateTime.now();
    second = 0;
    progressGauge = 0;
    tempReady = false;
    completeReady = false;
    ft2Logic.reset();
  }

  @override
  clear() {
    fullSet.clear();
    poseDataOneTicks.clear();
    resultMap.clear();
    nextIndex = 0;
    startDate = DateTime.now();
    second = 0;
    progressGauge = 0;
    tempReady = false;
    completeReady = false;
    ft2Logic.reset();
  }

  functionTestRun(PoseModelVo poseModelVo) {
    if (fullSet.first.index == 0) {
      //?????? ??????
      bool ready = ft2Logic.readyFTest(poseModelVo);
      if (ready) {
        if (tempReady == false) {
          startDate = DateTime.now();
          tempReady = true;
        } else {
          second =
              DateTime.now().difference(startDate).inSeconds.toDouble(); // ????????????

          if (DateTime.now().difference(startDate) >
              Duration(seconds: fullSet.first.second)) {
            print("3??? ?????? ??????");
            completeReady = true;
            fullSet.removeAt(0);
            nextIndex++;
          }
        }
      } else {
        startDate = DateTime.now();
        second =
            DateTime.now().difference(startDate).inSeconds.toDouble(); // ????????????
        tempReady = false;
      }
      print(ready);
      return false;
    } else {
      if (fullSet.first.second != -1) {
        FunctionTestSectionModel sectionModel = fullSet.first;
        if (sectionModel.index == nextIndex) {
          startDate = DateTime.now();
          nextIndex++;
        } else if (sectionModel.index < nextIndex) {
          //?????? Index ?????????
          second =
              DateTime.now().difference(startDate).inSeconds.toDouble(); // ????????????
          progressGauge = second / sectionModel.second; //?????????

          try {
            ft2Logic.fTest(poseModelVo, sectionModel.index); //???????????? ?????? ??????
          } catch (e) {
            print(e);
          }

          poseDataOneTicks.add(PoseDataOneTick(
              poseModelVo: poseModelVo,
              currentDateTime: DateTime.now())); //????????? ?????? ?????????// ????????? ?????? ?????????

          if (DateTime.now().difference(startDate) >
              Duration(seconds: sectionModel.second)) {
            //?????? Index ?????? ???

            //?????? Index ???????????? ?????? ??????
            resultMap[sectionModel.index] = poseDataOneTicks;

            //?????? Index ??? PoseData ?????????
            poseDataOneTicks.clear();

            //?????? Index ??? fullSet ??????
            fullSet.removeAt(0);
            //-> ?????????????????? nextIndex ??? ???????????? ????????? startDate ?????????
          }
        }
        return false;
      } else {
        //???????????? ?????? ??????
        return true;
      }
    }
  }
}

final ft2procedure = SpreadArmLeftProcedure();
