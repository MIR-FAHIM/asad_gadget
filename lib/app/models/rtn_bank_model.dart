// To parse this JSON data, do
//
//     final rtnBankListModel = rtnBankListModelFromJson(jsonString);

import 'dart:convert';

RtnBankListModel rtnBankListModelFromJson(String str) => RtnBankListModel.fromJson(json.decode(str));

String rtnBankListModelToJson(RtnBankListModel data) => json.encode(data.toJson());

class RtnBankListModel {
  String? result;
  String? message;
  List<DatumRtn>? data;

  RtnBankListModel({
     this.result,
     this.message,
     this.data,
  });

  factory RtnBankListModel.fromJson(Map<String, dynamic> json) => RtnBankListModel(
    result: json["result"],
    message: json["message"],
    data: List<DatumRtn>.from(json["data"].map((x) => DatumRtn.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumRtn {
  int id;
  String name;
  String logo;
  double chargeRate;
  int minChargeAmount;
  int maxChargeAmount;
  String status;

  DatumRtn({
    required this.id,
    required this.name,
    required this.logo,
    required this.chargeRate,
    required this.minChargeAmount,
    required this.maxChargeAmount,
    required this.status,
  });

  factory DatumRtn.fromJson(Map<String, dynamic> json) => DatumRtn(
    id: json["id"],
    name: json["name"],
    logo: json["logo"],
    chargeRate: json["charge_rate"]?.toDouble(),
    minChargeAmount: json["min_charge_amount"],
    maxChargeAmount: json["max_charge_amount"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "logo": logo,
    "charge_rate": chargeRate,
    "min_charge_amount": minChargeAmount,
    "max_charge_amount": maxChargeAmount,
    "status": status,
  };
}
