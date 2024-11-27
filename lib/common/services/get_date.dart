String getData(DateTime dateTime) {
  String date =
      "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}";
  return date;
}

String getTime(DateTime dateTime) {
  String time =
      "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
  return time;
}
