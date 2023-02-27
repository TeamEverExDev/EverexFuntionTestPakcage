import 'package:everex_function_test/funtion_test/procedure_interface.dart';
import 'package:everex_function_test/vo/function_test_section_model.dart';
import 'package:everex_function_test/vo/pose_data_one_tick.dart';
import 'package:everex_function_test/vo/pose_model_vo.dart';

import 'sitdown_and_bend_knee_test_right_logic.dart';

class SitdownAndBendKneeRightProcedure implements ProcedureInterface {
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
    ft5Logic.reset();
  }

  @override
  reset() {
    fullSet.clear();
    fullSet.add(FunctionTestSectionModel(
        index: 0, second: 5, done: false, active: true, imageAsset: ''));
    fullSet.add(FunctionTestSectionModel(
        index: 1, second: 10, done: false, active: true, imageAsset: ''));
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
    ft5Logic.reset();
  }

  @override
  setInit() {
    fullSet.add(FunctionTestSectionModel(
        index: 0, second: 5, done: false, active: true, imageAsset: ''));
    fullSet.add(FunctionTestSectionModel(
        index: 1, second: 10, done: false, active: true, imageAsset: ''));
    fullSet.add(FunctionTestSectionModel(
        index: 2, second: -1, done: false, active: false, imageAsset: ''));
    ft5Logic.reset();
  }

  functionTestRun(PoseModelVo poseModelVo) {
    if (fullSet.first.index == 0) {
      //준비 자세
      bool ready = ft5Logic.readyFTest(poseModelVo);
      if (ready) {
        if (tempReady == false) {
          startDate = DateTime.now();
          tempReady = true;
        } else {
          second =
              DateTime.now().difference(startDate).inSeconds.toDouble(); // 진행시간

          if (DateTime.now().difference(startDate) >
              Duration(seconds: fullSet.first.second)) {
            print("3초 유지 성공");
            completeReady = true;
            fullSet.removeAt(0);
            nextIndex++;
          }
        }
      } else {
        startDate = DateTime.now();
        second =
            DateTime.now().difference(startDate).inSeconds.toDouble(); // 진행시간
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
          //현재 Index 진행중
          second =
              DateTime.now().difference(startDate).inSeconds.toDouble(); // 진행시간
          progressGauge = second / sectionModel.second; //진행률

          try {
            ft5Logic.fTest(poseModelVo, sectionModel.index); //기능평가 로직 진행
          } catch (e) {
            print(e);
          }

          poseDataOneTicks.add(PoseDataOneTick(
              poseModelVo: poseModelVo,
              currentDateTime: DateTime.now())); //데이터 넣기 서버에// 보내기 위한 데이터

          if (DateTime.now().difference(startDate) >
              Duration(seconds: sectionModel.second)) {
            //현재 Index 작업 끝

            //현재 Index 키값으로 결과 저장
            resultMap[sectionModel.index] = poseDataOneTicks;

            //현재 Index 의 PoseData 초기화
            poseDataOneTicks.clear();

            //현재 Index 를 fullSet 제거
            fullSet.removeAt(0);
            //-> 다음인덱스는 nextIndex 와 같아지기 때문에 startDate 초기화
          }
        }
        return false;
      } else {
        //기능평가 완전 종료
        return true;
      }
    }
  }
}

final ft5procedure = SitdownAndBendKneeRightProcedure();
