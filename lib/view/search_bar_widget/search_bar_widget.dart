import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/city_response.dart';
import 'package:weather_app/models/models.dart';
import 'package:weather_app/providers/search_loading_state_provider.dart';
import 'package:weather_app/view/display_weather_screen/display_weather_screen.dart';
import 'package:weather_app/providers/filtered_cities_state_provider.dart';
import 'package:weather_app/service/filiter_city.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({
    super.key,
    required this.searchCityTextController,
    required this.loadedCities,
    required this.filteredList,
    required this.result,
  });

  final TextEditingController searchCityTextController;
  final List<CityReponse> loadedCities;
  final List<CityReponse> filteredList;
  final WeatherResponse? result;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSearchVisible = ref.watch(isSearchFieldDisplayStateProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 25, bottom: 8, left: 13, right: 13),
          child: CupertinoSearchTextField(
            itemSize: 18,
            placeholder: 'Search for a city',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.black,
              inherit: false,
            ),
            onTap: () {
              ref.read(isSearchFieldDisplayStateProvider.notifier).state = true;
            },
            onSubmitted: (v) {
              if (searchCityTextController.text.isNotEmpty) {
              } else {
                ref.read(isSearchFieldDisplayStateProvider.notifier).state =
                    false;
              }
            },
            controller: searchCityTextController,
            suffixIcon: const Icon(Icons.cancel),
            onSuffixTap: () {
              searchCityTextController.text = '';
              ref.read(isSearchFieldDisplayStateProvider.notifier).state =
                  false;
              ref.read(filtersCityListChangeNotifierProvider).clearList();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onChanged: (value) {
              ref.read(filtersCityListChangeNotifierProvider).clearList();

              filterCities(value, ref, loadedCities);
            },
          ),
        ),
        !isSearchVisible
            ? const SizedBox.shrink()
            : Expanded(
                child: filteredList.isEmpty &&
                        searchCityTextController.text.isNotEmpty
                    ? Center(
                        child: Text(
                          "No city found with ${searchCityTextController.text}",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      )
                    : filteredList.isEmpty
                        ? const Center(
                            child: Text(
                              "No Search",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        : ListView.builder(
                            itemCount: filteredList.length,
                            itemBuilder: (context, index) {
                              final cityName = filteredList[index].owmCityName;
                              final lowerCityName = cityName.toLowerCase();
                              final query =
                                  searchCityTextController.text.toLowerCase();

                              if (!lowerCityName.contains(query)) {
                                // Fallback if something goes wrong
                                return Text(cityName);
                              }

                              // Split the city name into parts for highlighting
                              final startIndex = lowerCityName.indexOf(query);
                              final endIndex = startIndex + query.length;

                              return ListTile(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    return DisplayWeatherScreen(
                                      selectedCity: filteredList[index],
                                    );
                                  }));
                                },
                                title: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: cityName.substring(0, startIndex),
                                        style:
                                            DefaultTextStyle.of(context).style,
                                      ),
                                      TextSpan(
                                        text: cityName.substring(
                                            startIndex, endIndex),
                                        style: DefaultTextStyle.of(context)
                                            .style
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            "${cityName.substring(endIndex)}, ${filteredList[index].localityShort}, ${filteredList[index].countryLong}",
                                        style:
                                            DefaultTextStyle.of(context).style,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
              ),
      ],
    );
  }
}
