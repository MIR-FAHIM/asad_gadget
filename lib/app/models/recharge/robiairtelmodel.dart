// To parse this JSON data, do
//
//     final robiAirtelOfferModel = robiAirtelOfferModelFromJson(jsonString);

import 'dart:convert';

RobiAirtelOfferModel robiAirtelOfferModelFromJson(String str) => RobiAirtelOfferModel.fromJson(json.decode(str));

String robiAirtelOfferModelToJson(RobiAirtelOfferModel data) => json.encode(data.toJson());

class RobiAirtelOfferModel {
  String result;
  List<Datumm> data;

  RobiAirtelOfferModel({
    required this.result,
    required this.data,
  });

  factory RobiAirtelOfferModel.fromJson(Map<String, dynamic> json) => RobiAirtelOfferModel(
    result: json["result"],
    data: List<Datumm>.from(json["data"].map((x) => Datumm.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datumm {
  String packageId;
  String offerName;
  String offerMessage;
  String amount;
  String offerType;
  var commission;
  var custCommission;
  var adminCommission;
  var rechargeCom;

  Datumm({
    required this.packageId,
    required this.offerName,
    required this.offerMessage,
    required this.amount,
    required this.offerType,
    required this.commission,
    required this.custCommission,
    required this.adminCommission,
    required this.rechargeCom,
  });

  factory Datumm.fromJson(Map<String, dynamic> json) => Datumm(
    packageId: json["package_id"],
    offerName: json["offer_name"],
    offerMessage: json["offer_message"],
    amount: json["amount"].toString(),
    offerType: json["offer_type"],
    commission: json["commission"],
    custCommission: json["cust_commission"],
    adminCommission: json["admin_commission"],
      rechargeCom: json["recharge_commission"],
  );

  Map<String, dynamic> toJson() => {
    "package_id": packageId,
    "offer_name": offerName,
    "offer_message": offerMessage,
    "amount": amount,
    "offer_type": offerType,
    "commission": commission,
    "cust_commission": custCommission,
    "admin_commission": adminCommission,
    "recharge_commission": rechargeCom,
  };
}
