landScapeCameraViewWidthCal(
    double cameraImageWith, double cameraImageHeight, double deviceHeight) {
  return cameraImageWith * deviceHeight / cameraImageHeight;
}

portraitCameraViewHeightCal(
    double cameraImageWith, double cameraImageHeight, double deviceWidth) {
  return cameraImageHeight * deviceWidth / cameraImageWith;
}
