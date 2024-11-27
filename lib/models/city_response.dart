import 'dart:convert';

List<CityReponse> cityReponseFromJson(String str) => List<CityReponse>.from(
    json.decode(str).map((x) => CityReponse.fromJson(x)));

String cityReponseToJson(List<CityReponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CityReponse {
  String owmCityId;
  String owmCityName;
  String owmLatitude;
  String owmLongitude;
  String owmCountry;
  String localityShort;
  String localityLong;
  String adminLevel1Short;
  String adminLevel1Long;
  String adminLevel2Short;
  String adminLevel2Long;
  String adminLevel3Short;
  String adminLevel3Long;
  String adminLevel4Short;
  String adminLevel4Long;
  String adminLevel5Short;
  String adminLevel5Long;
  String countryShort;
  String countryLong;
  String postalCode;

  CityReponse({
    required this.owmCityId,
    required this.owmCityName,
    required this.owmLatitude,
    required this.owmLongitude,
    required this.owmCountry,
    required this.localityShort,
    required this.localityLong,
    required this.adminLevel1Short,
    required this.adminLevel1Long,
    required this.adminLevel2Short,
    required this.adminLevel2Long,
    required this.adminLevel3Short,
    required this.adminLevel3Long,
    required this.adminLevel4Short,
    required this.adminLevel4Long,
    required this.adminLevel5Short,
    required this.adminLevel5Long,
    required this.countryShort,
    required this.countryLong,
    required this.postalCode,
  });

  factory CityReponse.fromJson(Map<String, dynamic> json) => CityReponse(
        owmCityId: json["owm_city_id"],
        owmCityName: json["owm_city_name"],
        owmLatitude: json["owm_latitude"],
        owmLongitude: json["owm_longitude"],
        owmCountry: json["owm_country"],
        localityShort: json["locality_short"],
        localityLong: json["locality_long"],
        adminLevel1Short: json["admin_level_1_short"],
        adminLevel1Long: json["admin_level_1_long"],
        adminLevel2Short: json["admin_level_2_short"],
        adminLevel2Long: json["admin_level_2_long"],
        adminLevel3Short: json["admin_level_3_short"],
        adminLevel3Long: json["admin_level_3_long"],
        adminLevel4Short: json["admin_level_4_short"],
        adminLevel4Long: json["admin_level_4_long"],
        adminLevel5Short: json["admin_level_5_short"],
        adminLevel5Long: json["admin_level_5_long"],
        countryShort: json["country_short"],
        countryLong: json["country_long"],
        postalCode: json["postal_code"],
      );

  Map<String, dynamic> toJson() => {
        "owm_city_id": owmCityId,
        "owm_city_name": owmCityName,
        "owm_latitude": owmLatitude,
        "owm_longitude": owmLongitude,
        "owm_country": owmCountry,
        "locality_short": localityShort,
        "locality_long": localityLong,
        "admin_level_1_short": adminLevel1Short,
        "admin_level_1_long": adminLevel1Long,
        "admin_level_2_short": adminLevel2Short,
        "admin_level_2_long": adminLevel2Long,
        "admin_level_3_short": adminLevel3Short,
        "admin_level_3_long": adminLevel3Long,
        "admin_level_4_short": adminLevel4Short,
        "admin_level_4_long": adminLevel4Long,
        "admin_level_5_short": adminLevel5Short,
        "admin_level_5_long": adminLevel5Long,
        "country_short": countryShort,
        "country_long": countryLong,
        "postal_code": postalCode,
      };
}
