import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/forecast_weather/list_element.dart';
import 'package:weather_app/view/display_weather_screen/components/forecast_card_heading.dart';

class FiveDayForecastWidget extends StatelessWidget {
  const FiveDayForecastWidget({
    super.key,
    required this.currentDayDetails,
  });

  final List<ListElement> currentDayDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          const ForecastCardHeading(
            iconName: CupertinoIcons.calendar,
            heading: '  5-Day Forecast',
          ),
          const Divider(
            height: 2,
            color: Colors.white54,
          ),
          // Use Expanded to take all the remaining space in the Column
          SizedBox(
            height: 200,
            child: Center(
                child: Text(
              "No Data",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            )),
          ),
        ],
      ),
    );
  }
}
