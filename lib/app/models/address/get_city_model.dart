// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  String result;
  List<CitDatum> data;

  CityModel({
    required this.result,
    required this.data,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    result: json["result"],
    data: List<CitDatum>.from(json["data"].map((x) => CitDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class CitDatum {
  int cityId;
  String cityName;

  CitDatum({
    required this.cityId,
    required this.cityName,
  });

  factory CitDatum.fromJson(Map<String, dynamic> json) => CitDatum(
    cityId: json["city_id"],
    cityName: json["city_name"],
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId,
    "city_name": cityName,
  };
}
