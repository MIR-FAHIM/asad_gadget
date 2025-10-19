// To parse this JSON data, do
//
//     final collectionDetailsModel = collectionDetailsModelFromJson(jsonString);

import 'dart:convert';

CollectionDetailsModel collectionDetailsModelFromJson(String str) => CollectionDetailsModel.fromJson(json.decode(str));

String collectionDetailsModelToJson(CollectionDetailsModel data) => json.encode(data.toJson());

class CollectionDetailsModel {
  String? message;
  dynamic errors;
  List<DatumCollection>? data;
  String? version;
  int? timestamp;

  CollectionDetailsModel({
     this.message,
    this.errors,
     this.data,
     this.version,
     this.timestamp,
  });

  factory CollectionDetailsModel.fromJson(Map<String, dynamic> json) => CollectionDetailsModel(
    message: json["message"],
    errors: json["errors"],
    data: List<DatumCollection>.from(json["data"].map((x) => DatumCollection.fromJson(x))),
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

class DatumCollection {
  String? paymentOption;
  String? status;
  String? mobile;
  String? paidAmount;
  String? reqAmount;
  String? reference;
  String? logoLink;
  DateTime? requestedAt;
  dynamic reconedAt;

  DatumCollection({
     this.paymentOption,
     this.status,
     this.paidAmount,
     this.reference,
    this.requestedAt,
    this.reconedAt,
    this.logoLink,
    this.reqAmount,
    this.mobile,
  });

  factory DatumCollection.fromJson(Map<String, dynamic> json) => DatumCollection(
    paymentOption: json["payment_option"],
    status: json["status"],
    paidAmount: json["paid_amount"],
    mobile: json["payer_acc_no"],

    reference: json["reference"],
    logoLink: json["logo_link"],
    reqAmount: json["req_amount"],
    requestedAt: json["requested_at"] == null ? DateTime.now() : DateTime.parse(json["requested_at"]),
    reconedAt: json["reconed_at"],
  );

  Map<String, dynamic> toJson() => {
    "payment_option": paymentOption,
    "status": status,
    "logo_link": logoLink,
    "paid_amount": paidAmount,
    "req_amount": reqAmount,
    "payer_acc_no": mobile,

    "reference": reference,
    "requested_at": requestedAt?.toIso8601String(),
    "reconed_at": reconedAt,
  };
}
