import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:weather_app/constants/env_constants.dart';
import 'package:weather_app/models/forecast_weather/forecase_weather_response.dart';

import '../models/models.dart';
import 'package:http/http.dart' as http;

class DataService {
  final weatherApiKey = envConstants.weatherApiKey;
  Future<WeatherResponse> getWeather(long, lat) async {
    try {
      final response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?&lon=$long&lat=$lat&appid=$weatherApiKey&units=metric'));
      final json = jsonDecode(response.body);
      final res = WeatherResponse.fromJson(json);
      debugPrint("reponse :: $res");
      return res;
    } catch (e, sT) {
      debugPrint("Error $e and StackTrace :: $sT");
      throw Exception();
    }
  }

  Future<ForecaseWeatherResponse> featchWeather(String locationId) async {
    try {
      final response = await http.get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/forecast?id=$locationId&appid=$weatherApiKey"));
      final json = jsonDecode(response.body);
      final result = ForecaseWeatherResponse.fromJson(json);
      debugPrint("result :: ${result.toJson()}");
      return result;
    } catch (e, sT) {
      debugPrint("Error :: $e and StackTrace :: $sT");
      throw Exception();
    }
  }
}
