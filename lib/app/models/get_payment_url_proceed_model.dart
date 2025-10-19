// To parse this JSON data, do
//
//     final getPaymentUrlModel = getPaymentUrlModelFromJson(jsonString);

import 'dart:convert';

GetPaymentUrlModel getPaymentUrlModelFromJson(String str) => GetPaymentUrlModel.fromJson(json.decode(str));

String getPaymentUrlModelToJson(GetPaymentUrlModel data) => json.encode(data.toJson());

class GetPaymentUrlModel {
  String message;
  dynamic errors;
  Data data;
  String version;
  int timestamp;

  GetPaymentUrlModel({
    required this.message,
    this.errors,
    required this.data,
    required this.version,
    required this.timestamp,
  });

  factory GetPaymentUrlModel.fromJson(Map<String, dynamic> json) => GetPaymentUrlModel(
    message: json["message"],
    errors: json["errors"],
    data: Data.fromJson(json["data"]),
    version: json["version"],
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "errors": errors,
    "data": data.toJson(),
    "version": version,
    "timestamp": timestamp,
  };
}

class Data {
  String statusCode;
  String status;
  String message;
  String paymentAmount;
  String invoiceNumber;
  String paymentUrl;

  Data({
    required this.statusCode,
    required this.status,
    required this.message,
    required this.paymentAmount,
    required this.invoiceNumber,
    required this.paymentUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    statusCode: json["status_code"],
    status: json["status"],
    message: json["message"],
    paymentAmount: json["payment_amount"],
    invoiceNumber: json["invoice_number"],
    paymentUrl: json["payment_url"],
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status": status,
    "message": message,
    "payment_amount": paymentAmount,
    "invoice_number": invoiceNumber,
    "payment_url": paymentUrl,
  };
}
