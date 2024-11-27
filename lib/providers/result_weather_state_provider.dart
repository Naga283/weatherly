import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/models.dart';

final resultWeatherStateProvider =
    StateProvider.autoDispose<WeatherResponse?>((ref) {
  return;
});
