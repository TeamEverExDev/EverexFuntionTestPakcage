import 'package:camera_platform_interface/src/types/camera_description.dart';
import 'package:everex_function_test/funtion_test/spread_arm_left/spread_arm_left_pose_painter.dart';
import 'package:everex_function_test/funtion_test/spread_arm_right/spread_arm_right_pose_painter.dart';
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
    default:
      return SpreadArmLeftPosePainter(
          width: width,
          height: height,
          poseModelVo: poseModelVo,
          lensDirection: lensDirection);
  }
}
