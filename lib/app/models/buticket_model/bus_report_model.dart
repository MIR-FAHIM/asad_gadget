// To parse this JSON data, do
//
//     final busReportModel = busReportModelFromJson(jsonString);

import 'dart:convert';

BusReportModel busReportModelFromJson(String str) => BusReportModel.fromJson(json.decode(str));

String busReportModelToJson(BusReportModel data) => json.encode(data.toJson());

class BusReportModel {
  String? result;
  List<DatumReport>? data;

  BusReportModel({
     this.result,
     this.data,
  });

  factory BusReportModel.fromJson(Map<String, dynamic> json) => BusReportModel(
    result: json["result"],
    data: List<DatumReport>.from(json["data"].map((x) => DatumReport.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumReport {
  String journeyRoute;
  DateTime journeyDate;
  String busName;
  String amount;
  int id;
  String status;

  DatumReport({
    required this.journeyRoute,
    required this.journeyDate,
    required this.busName,
    required this.amount,
    required this.id,
    required this.status,
  });

  factory DatumReport.fromJson(Map<String, dynamic> json) => DatumReport(
    journeyRoute: json["journey_route"],
    journeyDate: DateTime.parse(json["journey_date"]),
    busName: json["bus_name"],
    amount: json["amount"],
    id: json["id"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "journey_route": journeyRoute,
    "journey_date": journeyDate.toIso8601String(),
    "bus_name": busName,
    "amount": amount,
    "id": id,
    "status": status,
  };
}
