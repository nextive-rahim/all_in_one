import 'package:intl/intl.dart';

extension StringExtension on String {
  String get stripHtml => replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ').trim();
}

extension DurationExtension on Duration {
  String get formatToHMS => '$this'.split('.')[0].padLeft(8, '0');
}

String? getFormattedDate(DateTime? dateTime) {
  String? time;
  if (dateTime != null) {
    time = DateFormat.yMMMMd().format(dateTime);
  }
  return time;
}

String? getFormattedTime(DateTime? dateTime) {
  String? time;
  time = DateFormat.jm().format(dateTime!.toLocal());
  return time;
}

String? getFormattedDateTime(DateTime? dateTime) {
  String? time;
  if (dateTime != null) {
    time =
        '${DateFormat.yMMMMd().format(dateTime)}, ${DateFormat.jm().format(dateTime.toLocal())}';
  }
  return time;
}
