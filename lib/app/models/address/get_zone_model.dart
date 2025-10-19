// To parse this JSON data, do
//
//     final zoneModel = zoneModelFromJson(jsonString);

import 'dart:convert';

ZoneModel zoneModelFromJson(String str) => ZoneModel.fromJson(json.decode(str));

String zoneModelToJson(ZoneModel data) => json.encode(data.toJson());

class ZoneModel {
  String result;
  List<ZoneDatum> data;

  ZoneModel({
    required this.result,
    required this.data,
  });

  factory ZoneModel.fromJson(Map<String, dynamic> json) => ZoneModel(
    result: json["result"],
    data: List<ZoneDatum>.from(json["data"].map((x) => ZoneDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class ZoneDatum {
  int zoneId;
  String zoneName;

  ZoneDatum({
    required this.zoneId,
    required this.zoneName,
  });

  factory ZoneDatum.fromJson(Map<String, dynamic> json) => ZoneDatum(
    zoneId: json["zone_id"],
    zoneName: json["zone_name"],
  );

  Map<String, dynamic> toJson() => {
    "zone_id": zoneId,
    "zone_name": zoneName,
  };
}
