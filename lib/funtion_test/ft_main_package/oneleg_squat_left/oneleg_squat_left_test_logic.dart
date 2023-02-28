import 'dart:math';

import 'package:everex_function_test/funtion_test/test_logic_interface.dart';
import 'package:everex_function_test/funtion_test/util/evaluation_util.dart';
import 'package:everex_function_test/vo/pose_model_vo.dart';

class OnelegSquatLeftTestLogic implements TestLogicInterface {
  @override
  int? result;

  int currentLeftKneeAngle = 0;
  int currentLeftShoulderAngle = 0;
  int currentLeftHipAngle = 0;

  int finallyLeftKneeAngle = 0;
  int finallyLeftShoulderAngle = 0;
  int finallyLeftHipAngle = 0;

  bool isStart = false;
  bool isEnd = false;

  int currentScore = -1;

  bool isTargetOnGround = true;
  bool isOppositeOnGround = true;

  late PoseModelVo standardPoseModel;

  List<PoseModelVo> readyPoseData = <PoseModelVo>[];
  @override
  fTest(PoseModelVo poseModelVo, int ftSectionIndex) {}

  @override
  reset() {}

  @override
  resetResult() {
    result = null;
  }

  @override
  bool readyFTest(PoseModelVo poseModelVo) {
    if (poseModelVo.head!.x > 25 &&
        poseModelVo.head!.x < 35 &&
        poseModelVo.rightTiptoe!.y < 80 &&
        poseModelVo.leftTiptoe!.y < 80) {
      return true;
    } else {
      return false;
    }
  }

  saveReadyPoseData(PoseModelVo poseModelVo) {
    readyPoseData.add(poseModelVo);
  }

  clearReadyPoseData() {
    readyPoseData.clear();
  }

  createStandardPoint() {
    PosePoint headSum = PosePoint(0, 0);
    PosePoint neckSum = PosePoint(0, 0);
    PosePoint centerOfShoulderSum = PosePoint(0, 0);
    PosePoint rightShoulderSum = PosePoint(0, 0);
    PosePoint leftShoulderSum = PosePoint(0, 0);
    PosePoint rightElbowSum = PosePoint(0, 0);
    PosePoint leftElbowSum = PosePoint(0, 0);
    PosePoint rightWristSum = PosePoint(0, 0);
    PosePoint leftWristSum = PosePoint(0, 0);
    PosePoint rightPalmSum = PosePoint(0, 0);
    PosePoint leftPalmSum = PosePoint(0, 0);
    PosePoint rightPelvisSum = PosePoint(0, 0);
    PosePoint leftPelvisSum = PosePoint(0, 0);
    PosePoint rightKneeSum = PosePoint(0, 0);
    PosePoint leftKneeSum = PosePoint(0, 0);
    PosePoint rightAnkleSum = PosePoint(0, 0);
    PosePoint leftAnkleSum = PosePoint(0, 0);
    PosePoint rightTiptoeSum = PosePoint(0, 0);
    PosePoint leftTiptoeSUm = PosePoint(0, 0);
    PosePoint rightHeelSum = PosePoint(0, 0);
    PosePoint leftHeelSum = PosePoint(0, 0);
    PosePoint centerSpineSum = PosePoint(0, 0);
    PosePoint bottomSpineSum = PosePoint(0, 0);
    PosePoint centerPelvisSum = PosePoint(0, 0);

    for (var k in readyPoseData) {
      headSum = sumPoint(headSum, k.head!);
      neckSum = sumPoint(neckSum, k.neck!);
      centerOfShoulderSum = sumPoint(centerOfShoulderSum, k.centerOfShoulder!);
      rightShoulderSum = sumPoint(rightShoulderSum, k.rightShoulder!);
      leftShoulderSum = sumPoint(leftShoulderSum, k.leftShoulder!);
      rightElbowSum = sumPoint(rightElbowSum, k.rightElbow!);
      leftElbowSum = sumPoint(leftElbowSum, k.leftElbow!);
      rightWristSum = sumPoint(rightWristSum, k.rightWrist!);
      leftWristSum = sumPoint(leftWristSum, k.leftWrist!);
      rightPalmSum = sumPoint(rightPalmSum, k.rightPalm!);
      leftPalmSum = sumPoint(leftPalmSum, k.leftPalm!);
      rightPelvisSum = sumPoint(rightPelvisSum, k.rightPelvis!);
      leftPelvisSum = sumPoint(leftPelvisSum, k.leftPelvis!);
      rightKneeSum = sumPoint(rightKneeSum, k.rightKnee!);
      leftKneeSum = sumPoint(leftKneeSum, k.leftKnee!);
      rightAnkleSum = sumPoint(rightAnkleSum, k.rightAnkle!);
      leftAnkleSum = sumPoint(leftAnkleSum, k.leftAnkle!);
      rightTiptoeSum = sumPoint(rightTiptoeSum, k.rightTiptoe!);
      leftTiptoeSUm = sumPoint(leftTiptoeSUm, k.leftTiptoe!);
      rightHeelSum = sumPoint(rightHeelSum, k.rightHeel!);
      leftHeelSum = sumPoint(leftHeelSum, k.leftHeel!);
      centerSpineSum = sumPoint(centerSpineSum, k.centerSpine!);
      bottomSpineSum = sumPoint(bottomSpineSum, k.bottomSpine!);
      centerPelvisSum = sumPoint(centerPelvisSum, k.centerPelvis!);
    }

    headSum = avgPoint(headSum, readyPoseData.length);
    neckSum = avgPoint(neckSum, readyPoseData.length);
    centerOfShoulderSum = avgPoint(centerOfShoulderSum, readyPoseData.length);
    rightShoulderSum = avgPoint(rightShoulderSum, readyPoseData.length);
    leftShoulderSum = avgPoint(leftShoulderSum, readyPoseData.length);
    rightElbowSum = avgPoint(rightElbowSum, readyPoseData.length);
    leftElbowSum = avgPoint(leftElbowSum, readyPoseData.length);
    rightWristSum = avgPoint(rightWristSum, readyPoseData.length);
    leftWristSum = avgPoint(leftWristSum, readyPoseData.length);
    rightPalmSum = avgPoint(rightPalmSum, readyPoseData.length);
    leftPalmSum = avgPoint(leftPalmSum, readyPoseData.length);
    rightPelvisSum = avgPoint(rightPelvisSum, readyPoseData.length);
    leftPelvisSum = avgPoint(leftPelvisSum, readyPoseData.length);
    rightKneeSum = avgPoint(rightKneeSum, readyPoseData.length);
    leftKneeSum = avgPoint(leftKneeSum, readyPoseData.length);
    rightAnkleSum = avgPoint(rightAnkleSum, readyPoseData.length);
    leftAnkleSum = avgPoint(leftAnkleSum, readyPoseData.length);
    rightTiptoeSum = avgPoint(rightTiptoeSum, readyPoseData.length);
    leftTiptoeSUm = avgPoint(leftTiptoeSUm, readyPoseData.length);
    rightHeelSum = avgPoint(rightHeelSum, readyPoseData.length);
    leftHeelSum = avgPoint(leftHeelSum, readyPoseData.length);
    centerSpineSum = avgPoint(centerSpineSum, readyPoseData.length);
    bottomSpineSum = avgPoint(bottomSpineSum, readyPoseData.length);
    centerPelvisSum = avgPoint(centerPelvisSum, readyPoseData.length);

    standardPoseModel = PoseModelVo(
      head: headSum,
      neck: neckSum,
      centerOfShoulder: centerOfShoulderSum,
      rightShoulder: rightShoulderSum,
      leftShoulder: leftShoulderSum,
      rightElbow: rightElbowSum,
      leftElbow: leftElbowSum,
      rightWrist: rightWristSum,
      leftWrist: leftWristSum,
      rightPalm: rightPalmSum,
      leftPalm: leftPalmSum,
      rightPelvis: rightPelvisSum,
      leftPelvis: leftPelvisSum,
      rightKnee: rightKneeSum,
      leftKnee: leftKneeSum,
      rightAnkle: rightAnkleSum,
      leftAnkle: leftAnkleSum,
      rightTiptoe: rightTiptoeSum,
      leftTiptoe: leftTiptoeSUm,
      rightHeel: rightHeelSum,
      leftHeel: leftHeelSum,
      centerSpine: centerSpineSum,
      bottomSpine: bottomSpineSum,
      centerPelvis: centerPelvisSum,
    );
  }

  getSquatAngle(PoseModelVo poseModelVo) {
    PosePoint leftHip = poseModelVo.leftPelvis!;
    PosePoint rightHip = poseModelVo.rightPelvis!;
    PosePoint knee = poseModelVo.leftKnee!;
    PosePoint ankle = poseModelVo.leftAnkle!;
    PosePoint leftShoulder = poseModelVo.leftShoulder!;
    PosePoint rightShoulder = poseModelVo.rightShoulder!;

    currentLeftKneeAngle = 180 - get2DAngle(leftHip, knee, ankle).toInt();
    currentLeftShoulderAngle =
        get2DAngleBy2Point(leftShoulder, rightShoulder).toInt();

    if (currentLeftShoulderAngle >= 90) {
      currentLeftShoulderAngle = 180 - currentLeftShoulderAngle;
    }

    currentLeftHipAngle = get2DAngleBy2Point(leftHip, rightHip).toInt();

    if (currentLeftHipAngle >= 90) {
      currentLeftHipAngle = 180 - currentLeftHipAngle;
    }
  }

  checkCondition(PoseModelVo poseModelVo, int ftSectionIndex) {
    if (ftSectionIndex == 1) {
      currentScore = -1;
      finallyLeftHipAngle = 0;
      finallyLeftShoulderAngle = 0;
      finallyLeftKneeAngle = 0;

      isStart = false;
      isEnd = false;
    }

    PosePoint targetHeel = poseModelVo.leftHeel!;
    PosePoint targetAnkle = poseModelVo.leftAnkle!;
    PosePoint oppositeHeel = poseModelVo.rightHeel!;
    PosePoint oppositeAnkle = poseModelVo.rightAnkle!;

    isTargetOnGround = checkOnGround(targetHeel, targetAnkle,
        standardPoseModel.leftHeel!, standardPoseModel.leftAnkle!);

    isOppositeOnGround = checkOnGround(
      oppositeHeel,
      oppositeAnkle,
      standardPoseModel.rightHeel!,
      standardPoseModel.rightAnkle!,
    );

    bool isInRange = false;
    //끝난 게 아니면 양발의 상태를 체크한다.
    if (!isEnd) {
      //시작한 상태면 측정 대상의 발이 떨어지면 안되고, 반대편 발이 땅에 떨어져있어야한다.
      if (isStart) {
        if (!isTargetOnGround || isOppositeOnGround) {
          isEnd = true;
        } else {
          isInRange = true;
        }
      } else {
        if (isTargetOnGround &&
            !isOppositeOnGround &&
            checkAngle(poseModelVo)) {
          isStart = true;
          isInRange = true;
        }
      }
    }

    if (isInRange && checkAngle(poseModelVo)) {
      if (finallyLeftKneeAngle < currentLeftKneeAngle) {
        finallyLeftKneeAngle = currentLeftKneeAngle;
      }

      if (finallyLeftShoulderAngle < currentLeftShoulderAngle) {
        finallyLeftShoulderAngle = currentLeftShoulderAngle;
      }

      if (finallyLeftHipAngle < currentLeftHipAngle) {
        finallyLeftHipAngle = currentLeftHipAngle;
      }

      int temp = 0;

      temp += checkScore(finallyLeftShoulderAngle);

      temp += checkScore(finallyLeftHipAngle);

      temp += checkScore(finallyLeftKneeAngle);

      currentScore = convertScore(temp);
      result = currentScore;
    }
  }

  bool checkAngle(PoseModelVo poseModelVo) {
    //힙 - 무릎

    PosePoint targetHip = poseModelVo.leftPelvis!;
    PosePoint targetKnee = poseModelVo.leftKnee!;
    PosePoint targetAnkle = poseModelVo.leftAnkle!;

    double standardThighLength =
        getHeight(standardPoseModel.leftPelvis!, standardPoseModel.leftKnee!);
    double targetThighLength = getHeight(targetHip, targetKnee);

    if (targetThighLength > standardThighLength) {
      targetThighLength = standardThighLength;
    }

    double thighDegree =
        toDegrees(acos(targetThighLength / standardThighLength));

    double standardCalfLength =
        getHeight(standardPoseModel.leftKnee!, standardPoseModel.leftAnkle!);
    double targetCalfLength = getHeight(targetKnee, targetAnkle);

    if (targetCalfLength > standardCalfLength) {
      targetCalfLength = standardCalfLength;
    }

    double calfDegree = toDegrees(acos(targetCalfLength / standardCalfLength));

    if ((thighDegree + calfDegree) > 45) {
      return true;
    } else {
      return false;
    }
  }
}

final ft9Logic = OnelegSquatLeftTestLogic();
