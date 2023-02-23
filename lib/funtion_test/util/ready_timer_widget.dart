import 'package:flutter/material.dart';

class ReadyTimerWidget extends StatefulWidget {
  const ReadyTimerWidget({
    Key? key,
    required this.second,
    required this.ftId,
  }) : super(key: key);

  final int second;
  final int ftId;
  @override
  State<ReadyTimerWidget> createState() => _ReadyTimerWidgetState();
}

class _ReadyTimerWidgetState extends State<ReadyTimerWidget> {
  @override
  Widget build(BuildContext context) {
    Orientation viewOrientation = MediaQuery.of(context).orientation;

    if (viewOrientation == Orientation.landscape) {
      switch (widget.second) {
        case 0:
          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset("asset/fail_ready.png"),
              ),
              Align(
                alignment: Alignment(
                  0,
                  1,
                ),
                child: Padding(
                  padding: EdgeInsets.all(28.0),
                  child: Text(
                    "화면 안에 정면으로 서주세요",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          );
        case 1:
          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset("asset/ok_ready.png"),
              ),
              Align(
                alignment: Alignment(
                  0,
                  1,
                ),
                child: Padding(
                  padding: EdgeInsets.all(28.0),
                  child: Text(
                    "3초뒤 시작해주세요",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            ],
          );
        case 2:
          return const Align(
            alignment: Alignment(
              0,
              0,
            ),
            child: Padding(
              padding: EdgeInsets.all(28.0),
              child: Text(
                "3",
                style: TextStyle(
                  fontSize: 108,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        case 3:
          return const Align(
            alignment: Alignment(
              0,
              0,
            ),
            child: Text(
              "2",
              style: TextStyle(
                fontSize: 108,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        case 4:
          return const Align(
            alignment: Alignment(
              0,
              0,
            ),
            child: Padding(
              padding: EdgeInsets.all(28.0),
              child: Text(
                "1",
                style: TextStyle(
                  fontSize: 108,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        default:
          return Container();
      }
    } else {
      switch (widget.second) {
        case 0:
          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset("asset/fail_ready.png"),
              ),
              Align(
                alignment: Alignment(
                  0,
                  1,
                ),
                child: Padding(
                  padding: EdgeInsets.all(28.0),
                  child: Text(
                    "화면 안에\n정면으로 서주세요",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          );
        case 1:
          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset("asset/ok_ready.png"),
              ),
              Align(
                alignment: Alignment(
                  0,
                  1,
                ),
                child: Padding(
                  padding: EdgeInsets.all(28.0),
                  child: Text(
                    "3초 뒤\n시작해주세요",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            ],
          );
        case 2:
          return const Align(
            alignment: Alignment(
              0,
              0,
            ),
            child: Padding(
              padding: EdgeInsets.all(28.0),
              child: Text(
                "3",
                style: TextStyle(
                  fontSize: 108,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        case 3:
          return const Align(
            alignment: Alignment(
              0,
              0,
            ),
            child: Text(
              "2",
              style: TextStyle(
                fontSize: 108,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          );
        case 4:
          return const Align(
            alignment: Alignment(
              0,
              0,
            ),
            child: Padding(
              padding: EdgeInsets.all(28.0),
              child: Text(
                "1",
                style: TextStyle(
                  fontSize: 108,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          );
        default:
          return Container();
      }
    }
  }
}
