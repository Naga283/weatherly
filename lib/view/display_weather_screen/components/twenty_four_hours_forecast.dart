import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/common/services/get_date.dart';
import 'package:weather_app/models/forecast_weather/list_element.dart';
import 'package:weather_app/view/display_weather_screen/components/forecast_card_heading.dart';
import 'package:weather_app/view/display_weather_screen/services/kelvin_celsius.dart';

class TwentyFourHoursForecast extends StatelessWidget {
  const TwentyFourHoursForecast({
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
            iconName: CupertinoIcons.clock,
            heading: '  24 hours Forecast',
          ),
          const Divider(
            height: 2,
            color: Colors.white54,
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: currentDayDetails.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10,
                    ),
                    child: Column(
                      children: [
                        Text(
                          getTime(currentDayDetails[index].dtTxt),
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white70,
                              fontSize: 15),
                        ),
                        Image(
                          image: AssetImage(
                              "assets/icons/${currentDayDetails[index].weather[0].icon}.png"),
                          height: 30,
                          width: 33,
                        ),
                        Text(
                          '${kelvinToCelsius(currentDayDetails[index].main.temp).toStringAsFixed(1)}\u00B0',
                          style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white70,
                              fontSize: 15),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
