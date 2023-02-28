import 'package:camera_platform_interface/src/types/camera_description.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/oneleg_squat_left/oneleg_squat_left_pose_painter.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/oneleg_squat_right/oneleg_squat_right_pose_painter.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/raise_arm_forward_left/raise_arm_forward_left_pose_painter.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/raise_arm_forward_right/raise_arm_forward_right_pose_painter.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/sitdown_and_bend_knee_left/sitdown_and_bend_knee_left_pose_painter.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/sitdown_and_bend_knee_right/sitdown_and_bend_knee_right_pose_painter.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/sitdown_squat/sitdown_squat_painter.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/spread_arm_left/spread_arm_left_pose_painter.dart';
import 'package:everex_function_test/funtion_test/ft_main_package/spread_arm_right/spread_arm_right_pose_painter.dart';
import 'package:everex_function_test/vo/pose_model_vo.dart';
import 'package:flutter/material.dart';

CustomPainter ftestPainterSelect(double width, double height,
    PoseModelVo poseModelVo, int ftestId, CameraLensDirection lensDirection) {
  switch (ftestId) {
    case 1:
      return SpreadArmRightPosePainter(
          width: width,
          height: height,
          poseModelVo: poseModelVo,
          lensDirection: lensDirection);
    case 2:
      return SpreadArmLeftPosePainter(
          width: width,
          height: height,
          poseModelVo: poseModelVo,
          lensDirection: lensDirection);
    case 3:
      return RaiseArmForwardRightPosePainter(
          width: width,
          height: height,
          poseModelVo: poseModelVo,
          lensDirection: lensDirection);
    case 4:
      return RaiseArmForwardLeftPosePainter(
          width: width,
          height: height,
          poseModelVo: poseModelVo,
          lensDirection: lensDirection);
    case 5:
      return SitdownAndBendKneeRightPosePainter(
          width: width,
          height: height,
          poseModelVo: poseModelVo,
          lensDirection: lensDirection);
    case 6:
      return SitdownAndBendKneeLeftPosePainter(
          width: width,
          height: height,
          poseModelVo: poseModelVo,
          lensDirection: lensDirection);
    case 7:
      return SitdownSquatPosePainter(
          width: width,
          height: height,
          poseModelVo: poseModelVo,
          lensDirection: lensDirection);

    case 8:
      return OnelegSquatRightPosePainter(
          width: width,
          height: height,
          poseModelVo: poseModelVo,
          lensDirection: lensDirection);

    case 9:
      return OnelegSquatLeftPosePainter(
          width: width,
          height: height,
          poseModelVo: poseModelVo,
          lensDirection: lensDirection);

    default:
      return SpreadArmLeftPosePainter(
          width: width,
          height: height,
          poseModelVo: poseModelVo,
          lensDirection: lensDirection);
  }
}
