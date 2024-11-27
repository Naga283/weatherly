import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConstants {
  final weatherApiKey = dotenv.get("WEATHER_API_KEY");
}

final envConstants = EnvConstants();
