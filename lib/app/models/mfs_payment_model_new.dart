// To parse this JSON data, do
//
//     final mfsPaymentListModel = mfsPaymentListModelFromJson(jsonString);

import 'dart:convert';

MfsPaymentListModel mfsPaymentListModelFromJson(String str) => MfsPaymentListModel.fromJson(json.decode(str));

String mfsPaymentListModelToJson(MfsPaymentListModel data) => json.encode(data.toJson());

class MfsPaymentListModel {
  String? message;
  var errors;
  Data? data;
  String? version;
  int? timestamp;

  MfsPaymentListModel({
     this.message,
    this.errors,
     this.data,
     this.version,
     this.timestamp,
  });

  factory MfsPaymentListModel.fromJson(Map<String, dynamic> json) => MfsPaymentListModel(
    message: json["message"],
    errors: json["errors"],
    data: Data.fromJson(json["data"]),
    version: json["version"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "errors": errors,
    "data": data!.toJson(),
    "version": version,
    "timestamp": timestamp,
  };
}

class Data {
  List<PaymentOption> paymentOptions;

  Data({
    required this.paymentOptions,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    paymentOptions: List<PaymentOption>.from(json["payment_options"].map((x) => PaymentOption.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "payment_options": List<dynamic>.from(paymentOptions.map((x) => x.toJson())),
  };
}

class PaymentOption {
  int id;
  String logoLink;
  String name;
  String charge;

  PaymentOption({
    required this.id,
    required this.logoLink,
    required this.name,
    required this.charge,
  });

  factory PaymentOption.fromJson(Map<String, dynamic> json) => PaymentOption(
    id: json["id"],
    logoLink: json["logo_link"],
    name: json["name"],
    charge: json["charge"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "logo_link": logoLink,
    "name": name,
    "charge": charge,
  };
}
