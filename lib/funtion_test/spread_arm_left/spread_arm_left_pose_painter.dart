import 'package:everex_function_test/vo/pose_model_vo.dart';
import 'package:flutter/material.dart';

class SpreadArmLeftPosePainter extends CustomPainter {
  SpreadArmLeftPosePainter(
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
    if (poseModelVo != null) {
      List<PosePoint?> posePoint = poseModelVo!.getPosePointList();

      for (PosePoint? k in posePoint) {
        if (k != null) {
          canvas.drawCircle(posePointToOffset(k, width, height), 1, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant SpreadArmLeftPosePainter oldDelegate) {
    return oldDelegate.poseModelVo != poseModelVo;
  }
}

Offset posePointToOffset(PosePoint posePoint, double width, double height) {
  return Offset(
    translateX(
      posePoint.x!,
      width,
    ),
    translateY(
      posePoint.y!,
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
