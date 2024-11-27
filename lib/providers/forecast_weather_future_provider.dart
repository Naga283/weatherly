import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/forecast_weather/forecase_weather_response.dart';
import 'package:weather_app/service/dart_service.dart';

final forecastWeatherDetailsFutureProvider = FutureProvider.autoDispose
    .family<ForecaseWeatherResponse, ForecastWeatherFutureProvider>(
        (ref, params) async {
  try {
    final res = await DataService().featchWeather(params.locationId);
    debugPrint("reponse :: $res");
    return res;
  } catch (e, sT) {
    debugPrint("Error :: $e and stackTrace :: $sT");
    throw Exception();
  }
});

class ForecastWeatherFutureProvider {
  final String locationId;

  ForecastWeatherFutureProvider({
    required this.locationId,
  });
}
