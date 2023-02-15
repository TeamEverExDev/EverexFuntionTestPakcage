import 'package:intl/intl.dart';

class ConvertFunction {
  String dateToStringByFormatter(
      {required String formatter, DateTime? dateTime}) {
    dateTime ??= DateTime.now();

    DateFormat dateFormat = DateFormat(formatter);
    String strToday = dateFormat.format(dateTime);
    return strToday;
  }

  String durationToPlayTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));

    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  String phoneNumberAddHyphen(String phoneNumber) {
    return phoneNumber.replaceAllMapped(
        RegExp(r'(\d{3})(\d{3,4})(\d{4})'), (m) => '${m[1]}-${m[2]}-${m[3]}');
  }

  bool versionCheckApi(String nativeAppVersion, String minimAppVersion) {
    List<String> nativeVersion = nativeAppVersion.split(".");
    List<String> minVersion = minimAppVersion.split(".");
    bool a = false;
    for (var i = 0; i <= 2; i++) {
      a = int.parse(minVersion[i]) > int.parse(nativeVersion[i]);
      if (int.parse(minVersion[i]) != int.parse(nativeVersion[i])) break;
    }
    return a;
  }

  int millisecondToSecond({required int millisecond}) {
    return millisecond ~/ 1000;
  }

  String intToTimeFormat(int v) {
    int second = v % 60;
    double minuteTemp = v / 60;
    int minute = minuteTemp.toInt();

    String secondString = "";
    if (second.toString().length == 1) {
      secondString = "0" + second.toString();
    } else if (second.toString().length == 2) {
      secondString = second.toString();
    }

    List<String> result = <String>[];
    result.add(minute.toString());
    result.add(secondString);

    return "${result[0]}:${result[1]}";
  }

  DateTime stringToDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return parsedDate;
  }

  String convertSummaryStringDateToDate(String date) {
    DateTime temp = stringToDate(date);
    return convertFunction.dateToStringByFormatter(
        formatter: "MM.dd", dateTime: temp);
  }
}

final convertFunction = ConvertFunction();
