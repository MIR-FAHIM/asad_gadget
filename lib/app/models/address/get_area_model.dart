// To parse this JSON data, do
//
//     final areaModel = areaModelFromJson(jsonString);

import 'dart:convert';

AreaModel areaModelFromJson(String str) => AreaModel.fromJson(json.decode(str));

String areaModelToJson(AreaModel data) => json.encode(data.toJson());

class AreaModel {
  String result;
  List<AreaDatum> data;

  AreaModel({
    required this.result,
    required this.data,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) => AreaModel(
    result: json["result"],
    data: List<AreaDatum>.from(json["data"].map((x) => AreaDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class AreaDatum {
  int areaId;
  String areaName;

  AreaDatum({
    required this.areaId,
    required this.areaName,
  });

  factory AreaDatum.fromJson(Map<String, dynamic> json) => AreaDatum(
    areaId: json["area_id"],
    areaName: json["area_name"],
  );

  Map<String, dynamic> toJson() => {
    "area_id": areaId,
    "area_name": areaName,
  };
}
