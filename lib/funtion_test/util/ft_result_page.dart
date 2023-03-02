import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FtResultPage extends StatefulWidget {
  const FtResultPage({Key? key, required this.ftId, required this.ftResult})
      : super(key: key);

  final int ftId;
  final int ftResult;
  @override
  State<FtResultPage> createState() => _FtResultPageState();
}

class _FtResultPageState extends State<FtResultPage> {
  @override
  Widget build(BuildContext context) {
    Orientation viewOrientation = MediaQuery.of(context).orientation;

    if (viewOrientation == Orientation.landscape) {
      return Scaffold(
        body: Row(
          children: [
            Expanded(
                child: Center(
              child: Lottie.network(
                  'https://resources.mora.kr/static/app/ft/MORA_check.json',
                  repeat: false),
            )),
            Expanded(
                child: Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 64,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Text(
                      "기능평가를 완료했습니다",
                      style: const TextStyle(fontSize: 24, color: Colors.black)
                          .copyWith(height: 1.5, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                    child: Container(
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(8)),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                        child: Column(
                          children: [
                            Text(
                              ftIdToTitle(widget.ftId),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Text(
                              "${widget.ftResult.toString()} ${ftIdPerUnit(widget.ftId)}",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 24),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Theme.of(context).primaryColor),
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                            child: Text(
                              "확인",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )),
          ],
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            const SizedBox(
              height: 80,
            ),
            Lottie.network(
              'https://resources.mora.kr/static/app/ft/MORA_check.json',
              repeat: false,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                      child: Text(
                        "기능평가를 완료했습니다",
                        style: const TextStyle(
                                fontSize: 24, color: Colors.black)
                            .copyWith(height: 1.5, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(8),
                          color:
                              Theme.of(context).primaryColor.withOpacity(0.4),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                          child: Column(
                            children: [
                              Text(
                                ftIdToTitle(widget.ftId),
                                style: TextStyle(
                                    color: Colors.black, fontSize: 18),
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                "${widget.ftResult.toString()} ${ftIdPerUnit(widget.ftId)}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 24),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Theme.of(context).primaryColor),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
                              child: Text(
                                "확인",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}

String ftIdToTitle(int ftId) {
  switch (ftId) {
    case 0:
      return "";
    case 1:
      return "옆으로 팔 올리기(오른쪽)";
    case 2:
      return "옆으로 팔 올리기(왼쪽)";
    case 3:
      return "앞으로 팔 올리기 (오른쪽)";
    case 4:
      return "앞으로 팔 올리기 (왼쪽)";
    case 5:
      return "스쿼트";
    case 6:
      return "앉아서 무릎 굽혔다 펴기(오른쪽)";
    case 7:
      return "앉아서 무릎 굽혔다 펴기(왼쪽)";
    case 8:
      return "한발 스쿼트(오른쪽)";
    case 9:
      return "한발 스쿼트(왼쪽)";
    default:
      return "";
  }
}

String ftIdPerUnit(int ftId) {
  switch (ftId) {
    case 0:
      return "";
    case 1:
      return "도";
    case 2:
      return "도";
    case 3:
      return "도";
    case 4:
      return "도";
    case 5:
      return "개";
    case 6:
      return "도";
    case 7:
      return "도";
    case 8:
      return "점";
    case 9:
      return "점";
    default:
      return "";
  }
}
