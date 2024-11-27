import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/common/components/common_error.dart';
import 'package:weather_app/common/components/common_loading.dart';
import 'package:weather_app/models/city_response.dart';
import 'package:weather_app/view/display_weather_screen/components/display_weather_body.dart';
import 'package:weather_app/providers/forecast_weather_future_provider.dart';
import 'package:weather_app/providers/get_weather_details_future_provider.dart';

class DisplayWeatherScreen extends ConsumerStatefulWidget {
  const DisplayWeatherScreen({
    super.key,
    required this.selectedCity,
  });
  final CityReponse selectedCity;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DisplayWeatherScreenState();
}

class _DisplayWeatherScreenState extends ConsumerState<DisplayWeatherScreen> {
  late final weatherData = getWeatherDetailsFutureProvider(
    WeaterProviderFamily(
      long: widget.selectedCity.owmLongitude,
      lat: widget.selectedCity.owmLatitude,
    ),
  );
  late final forecaseData = forecastWeatherDetailsFutureProvider(
    ForecastWeatherFutureProvider(
      locationId: widget.selectedCity.owmCityId,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final getWeather = ref.watch(weatherData);
    final forecastWeather = ref.watch(forecaseData);
    return Scaffold(
      body: getWeather.when(
        data: (data) {
          return forecastWeather.when(
            data: (forecastData) {
              return DisplayWeatherBody(
                data: data,
                forecaseWeatherResponse: forecastData,
              );
            },
            error: (error, sT) {
              return const CommonError();
            },
            loading: () => const CommonLoading(),
          );
        },
        error: (e, sT) {
          return const CommonError();
        },
        loading: () {
          return const CommonLoading();
        },
      ),
    );
  }
}
