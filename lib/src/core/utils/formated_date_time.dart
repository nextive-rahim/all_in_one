// ignore: file_names
import 'package:intl/intl.dart';

class FormatedDateTime {
  static String formatedDateTime(String dateString,
      {String outputFormat = 'dd-MM-yyyy'}) {
    /// dd/MM/yyyy
    if ((dateString == '') || (dateString == 'undefined')) {
      return '';
    }
    DateTime date = DateTime.parse(dateString);
    String formatDate(DateTime date) => DateFormat(outputFormat).format(date);
    return formatDate(date);
  }

  static String formatedDateTime1(String dateString,
      {required String inputFormat, required String outputFormat}) {
    if ((dateString == '') || (dateString == 'undefined')) {
      return '';
    }
    var inputFormatDateFormat = DateFormat(inputFormat).parse(dateString, true);
    var outputFormatDateFormat = DateFormat(outputFormat);
    //var date = new DateTime
    // Times
    // DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(dateString);
    //var dateTime = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(dateString, true);
    var dateLocal = inputFormatDateFormat.toLocal();
    return //DateFormat.yMd().format(DateTime.parse(dateString));
        outputFormatDateFormat.format(dateLocal); // 2019-08-18
  }

  static String formatedDateTimeWithoutTimeZone(String dateString,
      {required String inputFormat, required String outputFormat}) {
    if ((dateString == '') || (dateString == 'undefined')) {
      return '';
    }
    var inputFormatDateFormat = DateFormat(inputFormat);
    var outputFormatDateFormat = DateFormat(outputFormat);
    return outputFormatDateFormat
        .format(inputFormatDateFormat.parse(dateString));
  }

  static String formatedTime(String dateString) {
    if (dateString == '') {
      return '';
    }
    DateTime date = DateTime.parse(dateString).toLocal();
    String formatTime(DateTime date) => DateFormat("hh:mma").format(date);
    return formatTime(date);
  }

  static String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('HH:mm a');
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    var diff = now.difference(date);

    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else if (diff.inDays > 0 && diff.inDays < 7) {
      if (diff.inDays == 1) {
        time = '${diff.inDays} day ago';
      } else {
        time = '${diff.inDays} days ago';
      }
    } else {
      if (diff.inDays == 7) {
        time = '${(diff.inDays / 7).floor()} week ago';
      } else {
        time = '${(diff.inDays / 7).floor()} weeks ago';
      }
    }

    return time;
  }
}
