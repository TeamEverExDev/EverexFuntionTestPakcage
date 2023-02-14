import 'dart:math';

class PoseModelVo {
  PosePoint? head;
  PosePoint? neck;
  PosePoint? centerOfShoulder;
  PosePoint? rightShoulder;
  PosePoint? leftShoulder;
  PosePoint? rightElbow;
  PosePoint? leftElbow;
  PosePoint? rightWrist;
  PosePoint? leftWrist;
  PosePoint? rightPalm;
  PosePoint? leftPalm;
  PosePoint? rightPelvis;
  PosePoint? leftPelvis;
  PosePoint? rightKnee;
  PosePoint? leftKnee;
  PosePoint? rightAnkle;
  PosePoint? leftAnkle;
  PosePoint? rightTiptoe;
  PosePoint? leftTiptoe;
  PosePoint? rightHeel;
  PosePoint? leftHeel;
  PosePoint? centerSpine;
  PosePoint? bottomSpine;
  PosePoint? centerPelvis;

  @override
  String toString() {
    return 'PoseModelVo{head: $head, neck: $neck, centerOfShoulder: $centerOfShoulder, rightShoulder: $rightShoulder, leftShoulder: $leftShoulder, rightElbow: $rightElbow, leftElbow: $leftElbow, rightWrist: $rightWrist, leftWrist: $leftWrist, rightPalm: $rightPalm, leftPalm: $leftPalm, rightPelvis: $rightPelvis, leftPelvis: $leftPelvis, rightKnee: $rightKnee, leftKnee: $leftKnee, rightAnkle: $rightAnkle, leftAnkle: $leftAnkle, rightTiptoe: $rightTiptoe, leftTiptoe: $leftTiptoe, rightHeel: $rightHeel, leftHeel: $leftHeel, centerSpine: $centerSpine, bottomSpine: $bottomSpine, centerPelvis: $centerPelvis}';
  }

  PoseModelVo(
      {this.head,
      this.neck,
      this.centerOfShoulder,
      this.rightShoulder,
      this.leftShoulder,
      this.rightElbow,
      this.leftElbow,
      this.rightWrist,
      this.leftWrist,
      this.rightPalm,
      this.leftPalm,
      this.rightPelvis,
      this.leftPelvis,
      this.rightKnee,
      this.leftKnee,
      this.rightAnkle,
      this.leftAnkle,
      this.rightTiptoe,
      this.leftTiptoe,
      this.rightHeel,
      this.leftHeel,
      this.centerSpine,
      this.bottomSpine,
      this.centerPelvis});

  List<PosePoint?> getPosePointList() {
    List<PosePoint?> posePoints = <PosePoint?>[];
    posePoints.add(head);
    posePoints.add(neck);
    posePoints.add(centerOfShoulder);
    posePoints.add(rightShoulder);
    posePoints.add(leftShoulder);
    posePoints.add(rightElbow);
    posePoints.add(leftElbow);
    posePoints.add(rightWrist);
    posePoints.add(leftWrist);
    posePoints.add(rightPalm);
    posePoints.add(leftPalm);
    posePoints.add(rightPelvis);
    posePoints.add(leftPelvis);
    posePoints.add(rightKnee);
    posePoints.add(leftKnee);
    posePoints.add(rightAnkle);
    posePoints.add(leftAnkle);
    posePoints.add(rightTiptoe);
    posePoints.add(leftTiptoe);
    posePoints.add(rightHeel);
    posePoints.add(leftHeel);
    posePoints.add(centerSpine);
    posePoints.add(bottomSpine);
    posePoints.add(centerPelvis);
    return posePoints;
  }

  PoseModelVo.fromList(List<double> poseData) {
    for (int i = 0; i < 48; i += 2) {
      switch (i) {
        case 0:
          head = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 2:
          neck = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 4:
          centerOfShoulder = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 6:
          rightShoulder = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 8:
          leftShoulder = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 10:
          rightElbow = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 12:
          leftElbow = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 14:
          rightWrist = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 16:
          leftWrist = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 18:
          rightPalm = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 20:
          leftPalm = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 22:
          rightPelvis = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 24:
          leftPelvis = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 26:
          rightKnee = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 28:
          leftKnee = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 30:
          rightAnkle = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 32:
          leftAnkle = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 34:
          rightTiptoe = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 36:
          leftTiptoe = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 38:
          rightHeel = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 40:
          leftHeel = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 42:
          centerSpine = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 44:
          bottomSpine = PosePoint(poseData[i], poseData[i + 1]);
          break;
        case 46:
          centerPelvis = PosePoint(poseData[i], poseData[i + 1]);
          break;
        default:
          break;
      }
    }
  }
}

class PosePoint {
  double x;
  double y;

  PosePoint(this.x, this.y);

  double distanceTo(PosePoint other) {
    double dx = x - other.x;
    double dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }
}
