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
    switch (widget.second) {
      case 0:
        return Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text(
                "이미지 자리",
                style: TextStyle(fontSize: 40, color: Colors.red),
              ),
            ),
            Align(
              alignment: const Alignment(
                0,
                1,
              ),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text(
                  "화면 안에 정면으로 서주세요",
                  style: TextStyle(
                    fontSize: 40,
                    color: Theme.of(context).primaryColor,
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
            const Align(
              alignment: Alignment.center,
              child: Text(
                "이미지 자리",
                style: TextStyle(fontSize: 40, color: Colors.red),
              ),
            ),
            Align(
              alignment: const Alignment(
                0,
                1,
              ),
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Text(
                  "3초뒤 시작해주세요",
                  style: TextStyle(
                    fontSize: 40,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
        );
      case 2:
        return Align(
          alignment: const Alignment(
            0,
            0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
              "3",
              style: TextStyle(
                fontSize: 108,
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        );
      case 3:
        return Align(
          alignment: const Alignment(
            0,
            0,
          ),
          child: Text(
            "2",
            style: TextStyle(
              fontSize: 108,
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      case 4:
        return Align(
          alignment: const Alignment(
            0,
            0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Text(
              "1",
              style: TextStyle(
                fontSize: 108,
                color: Theme.of(context).primaryColor,
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
