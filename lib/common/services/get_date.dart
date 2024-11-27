// import 'package:intl/intl.dart';

// String getTime(int timeStamp) {
//   DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
//   String x = DateFormat.H().format(time);
//   return x;
// }

String getData(DateTime dateTime) {
  // DateTime dateTime = DateTime.parse(val);
  // Extract date and time separately
  String date =
      "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  return date;
}

String getTime(DateTime dateTime) {
  String time =
      "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  return time;
}
