import 'dart:math' as math hide Point;

import 'package:everex_function_test/vo/pose_model_vo.dart';

const double RADIANS_TO_DEGREES = 57.29577951308232;
const int SITDOWN_DATA_KEY = 1;
const double START_CONDITION_ANGLE = 110.0;
const double END_CONDITION_ANGLE = 170.0;
const int FUNCTIONAL_TEST_SCORE_FIVE_CRITERIA = 5;
const int FUNCTIONAL_TEST_SCORE_FOUR_CRITERIA = 10;
const int FUNCTIONAL_TEST_SCORE_THREE_CRITERIA = 15;
const int FUNCTIONAL_TEST_SCORE_TWO_CRITERIA = 20;
const int FUNCTIONAL_TEST_SCORE_ONE_CRITERIA = 30;

enum FunctionalTestSubType { SU1, SU2 }

PosePoint sumPoint(PosePoint a, PosePoint b) {
  return PosePoint(a.x + b.x, a.y + b.y);
}

PosePoint avgPoint(PosePoint a, int count) {
  return PosePoint((a.x / count), (a.y / count));
}

double get2DAngle(PosePoint a, PosePoint b, PosePoint c) {
  PosePoint vector1 = PosePoint(0, 0);

  vector1.x = a.x - b.x;
  vector1.y = a.y - b.y;

  PosePoint vector2 = PosePoint(0, 0);
  vector2.x = c.x - b.x;
  vector2.y = c.y - b.y;

  double v1mag = math.sqrt(math.pow(vector1.x, 2) + math.pow(vector1.y, 2));
  double v2mag = math.sqrt(math.pow(vector2.x, 2) + math.pow(vector2.y, 2));

  //norm
  vector1.x = (vector1.x / v1mag);
  vector1.y = (vector1.y / v1mag);

  vector2.x = (vector2.x / v2mag);
  vector2.y = (vector2.y / v2mag);

  return toDegrees(math.acos(vector1.x * vector2.x + vector1.y * vector2.y));
}

//왼쪽이 양수 오른쪽이 음수
double get2DSign(PosePoint a, PosePoint b, PosePoint c) {
  PosePoint vector1 = PosePoint(0, 0);

  vector1.x = a.x - b.x;
  vector1.y = a.y - b.y;

  PosePoint vector2 = PosePoint(0, 0);
  vector2.x = c.x - b.x;
  vector2.y = c.y - b.y;

  double v1mag = math.sqrt(math.pow(vector1.x, 2) + math.pow(vector1.y, 2));
  double v2mag = math.sqrt(math.pow(vector2.x, 2) + math.pow(vector2.y, 2));

  //norm
  vector1.x = (vector1.x / v1mag);
  vector1.y = (vector1.y / v1mag);

  vector2.x = (vector2.x / v2mag);
  vector2.y = (vector2.y / v2mag);

  double det = vector1.x * vector2.y - vector1.y * vector2.x;
  double sign = det.isNegative ? 1 : -1;
  return sign;
}

double get2DSignReverse(PosePoint a, PosePoint b, PosePoint c) {
  PosePoint vector1 = PosePoint(0, 0);

  vector1.x = a.x - b.x;
  vector1.y = a.y - b.y;

  PosePoint vector2 = PosePoint(0, 0);
  vector2.x = c.x - b.x;
  vector2.y = c.y - b.y;

  double v1mag = math.sqrt(math.pow(vector1.x, 2) + math.pow(vector1.y, 2));
  double v2mag = math.sqrt(math.pow(vector2.x, 2) + math.pow(vector2.y, 2));

  //norm
  vector1.x = (vector1.x / v1mag);
  vector1.y = (vector1.y / v1mag);

  vector2.x = (vector2.x / v2mag);
  vector2.y = (vector2.y / v2mag);

  double det = vector1.x * vector2.y - vector1.y * vector2.x;
  double sign = det.isNegative ? -1 : 1;
  return sign;
}

double get2DAngleBy2Point(PosePoint a, PosePoint b) {
  PosePoint c = PosePoint(b.x, a.y);

  PosePoint vector1 = PosePoint(a.x - b.x, a.y - b.y);

  PosePoint vector2 = PosePoint(c.x - b.x, c.y - b.y);

  double v1mag = math.sqrt(math.pow(vector1.x, 2) + math.pow(vector1.y, 2));
  double v2mag = math.sqrt(math.pow(vector2.x, 2) + math.pow(vector2.y, 2));

  //norm
  vector1.x = vector1.x / v1mag;
  vector1.y = vector1.y / v1mag;

  vector2.x = vector2.x / v2mag;
  vector2.y = vector2.y / v2mag;

  return toDegrees(math.acos(vector1.x * vector2.x + vector1.y * vector2.y));
}

double toDegrees(double angrad) {
  return angrad * RADIANS_TO_DEGREES;
}

bool checkOnGround(
  PosePoint targetHeelPoint,
  PosePoint targetAnklePoint,
  PosePoint startHeelPoint,
  PosePoint startAnklePoint,
) {
  bool isOnGround = true;
  double currentHeel;
  double startHeel;
  double startAnkle;

  currentHeel = targetHeelPoint.y;
  startAnkle = startAnklePoint.y;
  startHeel = startHeelPoint.y;

  double offset = (startAnkle - startHeel).abs();
  bool isPositive = startAnkle > startHeel;

  if (isPositive) {
    if (currentHeel > startAnkle + offset) {
      isOnGround = false;
    }
  } else {
    if (currentHeel < startAnkle - offset) {
      isOnGround = false;
    }
  }

  return isOnGround;
}

///한발스쿼트 관련 점수 계산로직
int checkScore(int angle) {
  int score;
  if (angle <= FUNCTIONAL_TEST_SCORE_FIVE_CRITERIA) {
    score = 5;
  } else if (angle <= FUNCTIONAL_TEST_SCORE_FOUR_CRITERIA) {
    score = 4;
  } else if (angle <= FUNCTIONAL_TEST_SCORE_THREE_CRITERIA) {
    score = 3;
  } else if (angle <= FUNCTIONAL_TEST_SCORE_TWO_CRITERIA) {
    score = 2;
  } else if (angle <= FUNCTIONAL_TEST_SCORE_ONE_CRITERIA) {
    score = 1;
  } else {
    score = 0;
  }
  return score;
}

int convertScore(int scoreSum) {
  int totalSum = 0;
  totalSum += (scoreSum * 20) ~/ 3;

  return totalSum;
  // int count = 0;
  //
  // for (Map<String, int> score in scores) {
  //   int scoreSum = 0;
  //   if (score.keys.isEmpty) {
  //     continue;
  //   }
  //   bool isFail = false;
  //   for (String s in score.keys) {
  //     int? elementScore = score[s];
  //     if (elementScore == null || elementScore == -1) {
  //       isFail = true;
  //       break;
  //     }
  //     scoreSum += elementScore;
  //   }
  //   if (isFail) {
  //     continue;
  //   }
  //
  //   count++;
  // }
  //
  // if (count == 0) {
  //   return -1;
  // } else {
  //   return totalSum ~/ count;
  // }
}

double calculateRadian(PosePoint centerPoint, PosePoint targetPoint) {
  double tempX = targetPoint.x - centerPoint.x;
  double tempY = targetPoint.y - centerPoint.y;

  return (math.atan2(tempY, tempX) + math.pi * 2) % (math.pi * 2);
}

double calculateRadianThreePoint(
    PosePoint startPoint, PosePoint centerPoint, PosePoint endPoint) {
  return (calculateRadian(centerPoint, endPoint) -
          calculateRadian(centerPoint, startPoint) +
          math.pi * 2) %
      (math.pi * 2);
}

double calculateRadianOpposite(PosePoint point1, PosePoint point2) {
  double tempX = point1.x - point2.x;
  double tempY = point1.y - point2.y;

  print("calculateRadianOpposite ${tempX}");
  print("calculateRadianOpposite ${tempY}");

  if (tempX > 0) {
    return math.atan(tempY / tempX);
  } else {
    return math.atan(tempY / tempX) + math.pi;
  }
}
