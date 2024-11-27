import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:weather_app/models/city_response.dart';

Future<List<CityReponse>> loadCities() async {
  String data = await rootBundle.loadString('assets/json/citys.json');
  List<dynamic> cities = json.decode(data);

  return cities
      .map((e) => CityReponse.fromJson(e))
      .cast<CityReponse>()
      .toList();
}
