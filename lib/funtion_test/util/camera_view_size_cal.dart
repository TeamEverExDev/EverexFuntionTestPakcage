import 'dart:io';

import 'package:everex_function_test/vo/pose_model_vo.dart';
import 'package:flutter/material.dart';

double cameraViewSizeCal(double val, bool isLandscape) {
  if (Platform.isAndroid) {
    return val * 320 / 240;
  } else {
    return val * 350 / 288;
  }
}

double translateX(double x, double width) {
  return x * width / 60;
}

double translateY(double y, double height) {
  return y * height / 80;
}

Offset posePointToOffset(PosePoint posePoint, double width, double height) {
  return Offset(
    translateX(
      posePoint.x,
      width,
    ),
    translateY(
      posePoint.y,
      height,
    ),
  );
}
