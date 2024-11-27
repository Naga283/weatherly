// Function to get details for the current day
import 'package:weather_app/models/forecast_weather/list_element.dart';

List<ListElement> getCurrentDayDetails(
    List<ListElement> data, String currentDate) {
  List<ListElement> details = [];

  for (var item in data) {
    if (item.dtTxt.toString().startsWith(currentDate)) {
      details.add(item);
    }
  }

  return details;
}
