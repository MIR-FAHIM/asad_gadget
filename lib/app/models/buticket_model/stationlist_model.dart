// To parse this JSON data, do
//
//     final stationList = stationListFromJson(jsonString);

import 'dart:convert';

StationList stationListFromJson(String str) => StationList.fromJson(json.decode(str));

String stationListToJson(StationList data) => json.encode(data.toJson());

class StationList {
  StationList({
     this.message,
    this.errors,
     this.data,
     this.version,
     this.timestamp,
  });

  String? message;
  var errors;
  List<Datum>? data;
  String? version;
  int? timestamp;

  factory StationList.fromJson(Map<String, dynamic> json) => StationList(
    message: json["message"],
    errors: json["errors"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    version: json["version"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "errors": errors,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "version": version,
    "timestamp": timestamp,
  };
}

class Datum {
  Datum({
    required this.stationName,
  });

  String stationName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    stationName: json["station_name"],
  );

  Map<String, dynamic> toJson() => {
    "station_name": stationName,
  };
}
