import 'dart:math' as math;

import 'package:everex_function_test/funtion_test/util/camera_view_size_cal.dart';
import 'package:everex_function_test/funtion_test/util/evaluation_util.dart';
import 'package:everex_function_test/vo/pose_model_vo.dart';
import 'package:flutter/material.dart';

final pointPaint = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 10.0
  ..color = Color.fromRGBO(7, 190, 184, 1);

final bodyPaint = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 5.0
  ..color = Color.fromRGBO(7, 190, 184, 1);

final backgroundPaint = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 15.0
  ..color = Colors.white.withOpacity(0.35);

final anglePainter = Paint()
  ..style = PaintingStyle.stroke
  ..strokeWidth = 5
  ..color = Colors.white;

final anglePainterBackground = Paint()
  ..style = PaintingStyle.fill
  ..strokeWidth = 7
  ..color = Color.fromRGBO(7, 190, 184, 1).withOpacity(0.5);

DrawArcModel paintAngle(PosePoint startJoint, PosePoint centerJoint,
    PosePoint endJoint, bool opposite, double width, double height) {
  Offset center;
  Offset startPointOffset;
  Offset endPointOffset;

  center = Offset(
      translateX(
        centerJoint.x,
        width,
      ),
      translateY(centerJoint.y, height));

  startPointOffset =
      Offset(translateX(startJoint.x, width), translateY(startJoint.y, height));

  endPointOffset =
      Offset(translateX(endJoint.x, width), translateY(endJoint.y, height));

  PosePoint startPoint = PosePoint(startPointOffset.dx, startPointOffset.dy);
  PosePoint centerPoint = PosePoint(center.dx, center.dy);
  PosePoint endPoint = PosePoint(endPointOffset.dx, endPointOffset.dy);

  final rect = Rect.fromCircle(center: center, radius: 60);

  if (opposite) {
    double startRadAngle;

    double sweepRadAngle =
        calculateRadianThreePoint(startPoint, centerPoint, endPoint);

    if (sweepRadAngle > math.pi) {
      PosePoint tempPoint = PosePoint(center.dx * 2 - startPointOffset.dx,
          center.dy * 2 - startPointOffset.dy);

      startRadAngle = calculateRadian(centerPoint, tempPoint);
      sweepRadAngle = sweepRadAngle - math.pi;
    } else {
      startRadAngle = calculateRadian(centerPoint, endPoint);
      sweepRadAngle = math.pi - sweepRadAngle;
    }

    return DrawArcModel(
        rect: rect, startRadAngle: startRadAngle, sweepRadAngle: sweepRadAngle);
  } else {
    double startRadAngle = calculateRadian(centerPoint, startPoint);

    double sweepRadAngle =
        calculateRadianThreePoint(startPoint, centerPoint, endPoint);

    return DrawArcModel(
        rect: rect, startRadAngle: startRadAngle, sweepRadAngle: sweepRadAngle);
  }
}

class DrawArcModel {
  late Rect rect;
  late double startRadAngle;
  late double sweepRadAngle;

  DrawArcModel(
      {required this.rect,
      required this.startRadAngle,
      required this.sweepRadAngle});
}
