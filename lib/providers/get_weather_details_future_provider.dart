import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/models.dart';
import 'package:weather_app/service/dart_service.dart';

final getWeatherDetailsFutureProvider = FutureProvider.autoDispose
    .family<WeatherResponse, WeaterProviderFamily>((ref, params) async {
  try {
    final res = await DataService().getWeather(params.long, params.lat);
    debugPrint("reponse :: $res");
    return res;
  } catch (e, sT) {
    debugPrint("Error :: $e and StackTrace :: $sT");
    throw Exception();
  }
});

class WeaterProviderFamily {
  final String long;
  final String lat;

  WeaterProviderFamily({required this.long, required this.lat});
}
