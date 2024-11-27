import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/city_response.dart';
import 'package:weather_app/view/about_screen/about_screen.dart';
import 'package:weather_app/view/search_bar_widget/search_bar_widget.dart';
import 'package:weather_app/providers/filtered_cities_state_provider.dart';
import 'package:weather_app/providers/result_weather_state_provider.dart';
import 'package:weather_app/service/load_cities.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController searchCityTextController =
      TextEditingController();
  List<CityReponse> loadedCities = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      loadedCities = await loadCities();
    });
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(resultWeatherStateProvider);
    // final searchLoading = ref.watch(searchLoadingStateProvider);
    final filteredList =
        ref.watch(filtersCityListChangeNotifierProvider).filtersCities;

    return Scaffold(
      appBar: AppBar(
        // forceMaterialTransparency: true,
        // surfaceTintColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Weatherly",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const AboutScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.info),
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Flexible(
              child: SearchBarWidget(
                searchCityTextController: searchCityTextController,
                loadedCities: loadedCities,
                filteredList: filteredList,
                result: result,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
