import 'package:everex_function_test/funtion_test/util/convert_function.dart';
import 'package:flutter/material.dart';

class TestTimerAndScoreWidget extends StatefulWidget {
  const TestTimerAndScoreWidget(
      {Key? key,
      required this.value,
      required this.remainSecond,
      required this.ftId,
      required this.resultTitle,
      required this.result})
      : super(key: key);

  final double value;
  final double remainSecond;
  final int ftId;
  final String resultTitle;
  final String result;

  @override
  State<TestTimerAndScoreWidget> createState() =>
      _TestTimerAndScoreWidgetState();
}

class _TestTimerAndScoreWidgetState extends State<TestTimerAndScoreWidget> {
  @override
  Widget build(BuildContext context) {
    Orientation viewOrientation = MediaQuery.of(context).orientation;

    if (viewOrientation == Orientation.portrait) {
      return Stack(
        children: [
          Column(
            children: [
              Container(
                height: 10,
                child: LinearProgressIndicator(
                  value: widget.value,
                  color: Theme.of(context).primaryColor,
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.3),
                ),
              ),
              Container(
                width: double.infinity,
                height: 110,
                color: Colors.black.withOpacity(0.4),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "시간",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700),
                          ),
                          Text(
                            convertFunction
                                .intToTimeFormat((widget.remainSecond).toInt()),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontSize: 48,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    height: 1),
                          )
                        ],
                      ),
                    )),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.white,
                    ),
                    Expanded(
                        child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.resultTitle,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontSize: 26,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                          ),
                          Text(
                            widget.result,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontSize: 48,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    height: 1),
                          )
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Stack(
        children: [
          Column(
            children: [
              Container(
                height: 10,
                child: LinearProgressIndicator(
                  value: widget.value,
                  color: Theme.of(context).primaryColor,
                  backgroundColor:
                      Theme.of(context).primaryColor.withOpacity(0.3),
                ),
              ),
              Container(
                width: double.infinity,
                height: 80,
                color: Colors.black.withOpacity(0.4),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "시간",
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w700),
                          ),
                          Text(
                            convertFunction
                                .intToTimeFormat((widget.remainSecond).toInt()),
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontSize: 48,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    height: 1),
                          )
                        ],
                      ),
                    )),
                    Container(
                      height: 40,
                      width: 1,
                      color: Colors.white,
                    ),
                    Expanded(
                        child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.resultTitle,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontSize: 26,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                          ),
                          Text(
                            widget.result,
                            style: Theme.of(context)
                                .textTheme
                                .headline1!
                                .copyWith(
                                    fontSize: 48,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    height: 1),
                          )
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    }
  }
}
