import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/city_response.dart';
import 'package:weather_app/providers/filtered_cities_state_provider.dart';

Future<void> filterCities(
  String query,
  WidgetRef ref,
  List<CityReponse> loadedCities,
) async {
  if (query.isNotEmpty) {
    String searchQuery = query.toLowerCase();

    List<CityReponse> filteredCities = loadedCities.where((city) {
      return city.owmCityName.toLowerCase().contains(searchQuery);
    }).toList();

    ref
        .read(filtersCityListChangeNotifierProvider)
        .addedIntoList(filteredCities, query);
  } else {
    ref.read(filtersCityListChangeNotifierProvider).clearList();
  }
}
