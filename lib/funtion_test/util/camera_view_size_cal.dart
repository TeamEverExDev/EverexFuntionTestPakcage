import 'dart:io';

double cameraViewSizeCal(double val, bool isLandscape) {
  if (Platform.isAndroid) {
    return val * 320 / 240;
  } else {
    return val * 350 / 288;
  }
}
