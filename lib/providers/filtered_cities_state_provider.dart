import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/city_response.dart';

class FilterCityListChangeNotifier extends ChangeNotifier {
  List<CityReponse> filtersCities = [];
  String query = "";

  addedIntoList(List<CityReponse> list, String queryVal) {
    filtersCities = list;
    query = queryVal;
    notifyListeners();
  }

  clearList() {
    filtersCities.clear();
    query = "";
    notifyListeners();
  }
}

final filtersCityListChangeNotifierProvider =
    ChangeNotifierProvider<FilterCityListChangeNotifier>(
        (ref) => FilterCityListChangeNotifier());
