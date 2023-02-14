import 'package:everex_function_test/vo/pose_model_vo.dart';
import 'package:flutter/material.dart';

class SpreadArmRightPosePainter extends CustomPainter {
  SpreadArmRightPosePainter(
      {this.poseModelVo, required this.width, required this.height});

  final PoseModelVo? poseModelVo;
  final double width;
  final double height;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..color = Color.fromRGBO(7, 190, 184, 1);
    final bodyPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..color = Color.fromRGBO(7, 190, 184, 1);

    if (poseModelVo != null) {
      void paintLine(PosePoint type1, PosePoint type2, Paint paintType) {
        if ((type1.x <= 0 && type1.y <= 0) || (type2.x <= 0 && type2.y <= 0)) {
        } else {
          canvas.drawLine(
              Offset(translateX(type1.x, width), translateY(type1.y, height)),
              Offset(translateX(type2.x, width), translateY(type2.y, height)),
              paintType);
        }
      }

      List<PosePoint?> posePoint = poseModelVo!.getPosePointList();

      ///Draw Circle
      for (PosePoint? k in posePoint) {
        if (k != null) {
          if (k.x == 0 && k.y == 0) {
          } else {
            canvas.drawCircle(posePointToOffset(k, width, height), 1, paint);
          }
        }
      }

      //Draw Line
      paintLine(poseModelVo!.head!, poseModelVo!.neck!, bodyPaint);
      paintLine(poseModelVo!.neck!, poseModelVo!.centerOfShoulder!, bodyPaint);
      paintLine(poseModelVo!.centerOfShoulder!, poseModelVo!.leftShoulder!,
          bodyPaint);
      paintLine(poseModelVo!.centerOfShoulder!, poseModelVo!.rightShoulder!,
          bodyPaint);
      paintLine(
          poseModelVo!.centerOfShoulder!, poseModelVo!.centerSpine!, bodyPaint);
      paintLine(
          poseModelVo!.centerSpine!, poseModelVo!.centerPelvis!, bodyPaint);

      paintLine(
          poseModelVo!.centerPelvis!, poseModelVo!.leftPelvis!, bodyPaint);
      paintLine(
          poseModelVo!.centerPelvis!, poseModelVo!.rightPelvis!, bodyPaint);
      paintLine(poseModelVo!.rightPelvis!, poseModelVo!.rightKnee!, bodyPaint);
      paintLine(poseModelVo!.leftPelvis!, poseModelVo!.leftKnee!, bodyPaint);
      paintLine(poseModelVo!.rightKnee!, poseModelVo!.rightAnkle!, bodyPaint);
      paintLine(poseModelVo!.rightAnkle!, poseModelVo!.rightTiptoe!, bodyPaint);
      paintLine(poseModelVo!.rightTiptoe!, poseModelVo!.rightHeel!, bodyPaint);

      paintLine(poseModelVo!.leftKnee!, poseModelVo!.leftAnkle!, bodyPaint);
      paintLine(poseModelVo!.leftAnkle!, poseModelVo!.leftTiptoe!, bodyPaint);
      paintLine(poseModelVo!.leftTiptoe!, poseModelVo!.leftHeel!, bodyPaint);

      paintLine(
          poseModelVo!.rightShoulder!, poseModelVo!.rightElbow!, bodyPaint);
      paintLine(poseModelVo!.rightElbow!, poseModelVo!.rightWrist!, bodyPaint);
      paintLine(poseModelVo!.rightWrist!, poseModelVo!.rightPalm!, bodyPaint);

      paintLine(poseModelVo!.leftShoulder!, poseModelVo!.leftElbow!, bodyPaint);
      paintLine(poseModelVo!.leftElbow!, poseModelVo!.leftWrist!, bodyPaint);
      paintLine(poseModelVo!.leftWrist!, poseModelVo!.leftPalm!, bodyPaint);
    }
  }

  @override
  bool shouldRepaint(covariant SpreadArmRightPosePainter oldDelegate) {
    return oldDelegate.poseModelVo != poseModelVo;
  }
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

double translateX(double x, double width) {
  return x * width / 60;
}

double translateY(double y, double height) {
  return y * height / 80;
}
