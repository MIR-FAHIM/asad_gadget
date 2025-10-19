// To parse this JSON data, do
//
//     final getPermissionModel = getPermissionModelFromJson(jsonString);

import 'dart:convert';

GetPermissionModel getPermissionModelFromJson(String str) => GetPermissionModel.fromJson(json.decode(str));

String getPermissionModelToJson(GetPermissionModel data) => json.encode(data.toJson());

class GetPermissionModel {
  String? result;
  Data? data;

  GetPermissionModel({
     this.result,
     this.data,
  });

  factory GetPermissionModel.fromJson(Map<String, dynamic> json) => GetPermissionModel(
    result: json["result"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "data": data!.toJson(),
  };
}

class Data {
  int allowRecharge;
  int allowOtf;
  int allowUtility;
  int allowTicket;
  int allowCollection;
  int allowCashin;
  int allowCashout;
  int allowMoneyout;
  int allowMbanking;

  Data({
    required this.allowRecharge,
    required this.allowOtf,
    required this.allowUtility,
    required this.allowTicket,
    required this.allowCollection,
    required this.allowCashin,
    required this.allowCashout,
    required this.allowMoneyout,
    required this.allowMbanking
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    allowRecharge: json["allow_recharge"],
    allowOtf: json["allow_otf"],
    allowUtility: json["allow_utility"],
    allowTicket: json["allow_ticket"],
    allowCollection: json["allow_collection"],
    allowCashin: json["allow_cashin"],
    allowCashout: json["allow_cashout"],
    allowMoneyout: json["allow_moneyout"],
    allowMbanking: json["allow_mbanking"],
  );

  Map<String, dynamic> toJson() => {
    "allow_recharge": allowRecharge,
    "allow_otf": allowOtf,
    "allow_utility": allowUtility,
    "allow_ticket": allowTicket,
    "allow_collection": allowCollection,
    "allow_cashin": allowCashin,
    "allow_cashout": allowCashout,
    "allow_moneyout": allowMoneyout,
    "allow_mbanking": allowMbanking,
  };
}
