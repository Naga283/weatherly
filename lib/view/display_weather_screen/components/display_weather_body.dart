import 'package:flutter/material.dart';
import 'package:weather_app/extensions/capitaliza.dart';
import 'package:weather_app/models/forecast_weather/forecase_weather_response.dart';
import 'package:weather_app/models/models.dart';
import 'package:glass/glass.dart';
import 'package:weather_app/view/display_weather_screen/components/five_days_forecast_widget.dart';
import 'package:weather_app/view/display_weather_screen/components/twenty_four_hours_forecast.dart';
import 'package:weather_app/view/display_weather_screen/services/current_day_details.dart';

class DisplayWeatherBody extends StatelessWidget {
  const DisplayWeatherBody({
    super.key,
    required this.data,
    required this.forecaseWeatherResponse,
  });
  final WeatherResponse data;
  final ForecaseWeatherResponse forecaseWeatherResponse;
  @override
  Widget build(BuildContext context) {
    var currentDayDetails = getCurrentDayDetails(forecaseWeatherResponse.list,
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}");
    var sizedBox = const SizedBox(
      height: 40,
    );
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          // opacity: 0.5,
          image: AssetImage(
            "assets/images/${data.weatherInfo.icon}.jpeg",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 60.0,
                    bottom: 20,
                  ),
                  child:
                      Image.asset("assets/icons/${data.weatherInfo.icon}.png"),
                ),
                Text(
                  data.cityName,
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    '${data.tempInfo.temperature.toStringAsFixed(0)}\u00B0 | ${data.weatherInfo.description.toTitleCase()}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  'H:${data.tempInfo.temperature.toStringAsFixed(0)}\u00B0  L:${data.tempInfo.temperature.toStringAsFixed(0)}\u00B0',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                sizedBox,
                TwentyFourHoursForecast(currentDayDetails: currentDayDetails)
                    .asGlass(clipBorderRadius: BorderRadius.circular(10)),
                sizedBox,
                FiveDayForecastWidget(currentDayDetails: currentDayDetails)
                    .asGlass(clipBorderRadius: BorderRadius.circular(10)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
