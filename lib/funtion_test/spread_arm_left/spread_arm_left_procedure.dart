import 'package:everex_function_test/funtion_test/procedure_interface.dart';
import 'package:everex_function_test/vo/function_test_section_model.dart';

class SpreadArmLeftProcedure implements ProcedureInterface {
  late List<FunctionTestSectionModel> fullSet;

  @override
  setInit() {
    fullSet = [];
    fullSet.add(FunctionTestSectionModel(
        index: 0, second: 15, done: false, active: true, imageAsset: ''));
  }

  @override
  reset() {
    fullSet.clear();
    fullSet.add(FunctionTestSectionModel(
        index: 0, second: 15, done: false, active: true, imageAsset: ''));
  }

  @override
  clear() {
    fullSet.clear();
  }
}
