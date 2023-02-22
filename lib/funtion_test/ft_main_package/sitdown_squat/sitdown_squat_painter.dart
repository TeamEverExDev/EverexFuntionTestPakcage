import 'package:camera/camera.dart';
import 'package:everex_function_test/funtion_test/util/camera_view_size_cal.dart';
import 'package:everex_function_test/funtion_test/util/draw_util_function.dart';
import 'package:everex_function_test/vo/pose_model_vo.dart';
import 'package:flutter/material.dart';

class SitdownSquatPosePainter extends CustomPainter {
  SitdownSquatPosePainter(
      {this.poseModelVo,
      required this.width,
      required this.height,
      required this.lensDirection});

  final PoseModelVo? poseModelVo;
  final double width;
  final double height;
  final CameraLensDirection lensDirection;

  @override
  void paint(Canvas canvas, Size size) {
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
            canvas.drawCircle(
                posePointToOffset(k, width, height), 1, pointPaint);
            canvas.drawCircle(
                posePointToOffset(k, width, height), 2, backgroundPaint);
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

      DrawArcModel t1 = paintAngle(
          poseModelVo!.leftPelvis!,
          poseModelVo!.leftShoulder!,
          poseModelVo!.leftElbow!,
          false,
          width,
          height);

      if (lensDirection == CameraLensDirection.back) {
        t1 = paintAngle(poseModelVo!.leftElbow!, poseModelVo!.leftShoulder!,
            poseModelVo!.leftPelvis!, false, width, height);
      } else if (lensDirection == CameraLensDirection.front) {
        t1 = paintAngle(poseModelVo!.leftPelvis!, poseModelVo!.leftShoulder!,
            poseModelVo!.leftElbow!, false, width, height);
      }

      canvas.drawArc(
          t1.rect, t1.startRadAngle, t1.sweepRadAngle, true, anglePainter);
      canvas.drawArc(t1.rect, t1.startRadAngle, t1.sweepRadAngle, true,
          anglePainterBackground);
    }
  }

  @override
  bool shouldRepaint(covariant SitdownSquatPosePainter oldDelegate) {
    return oldDelegate.poseModelVo != poseModelVo;
  }
}
