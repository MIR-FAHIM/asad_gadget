// To parse this JSON data, do
//
//     final addBalanceHistoryModel = addBalanceHistoryModelFromJson(jsonString);

import 'dart:convert';

AddBalanceHistoryModel addBalanceHistoryModelFromJson(String str) => AddBalanceHistoryModel.fromJson(json.decode(str));

String addBalanceHistoryModelToJson(AddBalanceHistoryModel data) => json.encode(data.toJson());

class AddBalanceHistoryModel {
  String result;
  List<DatumHistory> data;

  AddBalanceHistoryModel({
    required this.result,
    required this.data,
  });

  factory AddBalanceHistoryModel.fromJson(Map<String, dynamic> json) => AddBalanceHistoryModel(
    result: json["result"],
    data: List<DatumHistory>.from(json["data"].map((x) => DatumHistory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumHistory {
  DateTime tranTime;
  double amount;
  String paymentMethod;
  String trxId;
  String mobile;
  String invoiceNumber;
  String description;
  String logoLink;

  DatumHistory({
    required this.tranTime,
    required this.amount,
    required this.paymentMethod,
    required this.trxId,
    required this.invoiceNumber,
    required this.description,
    required this.logoLink,
    required this.mobile
  });

  factory DatumHistory.fromJson(Map<String, dynamic> json) => DatumHistory(
    tranTime: DateTime.parse(json["tran_time"]),
    amount: json["amount"]?.toDouble(),
    paymentMethod: json["payment_method"],
    trxId: json["trxId"],
      mobile: json["payer_acc_no"] ,
    invoiceNumber: json["invoice_number"]??"no data",
    description: json["description"],

    logoLink:   json["logo_url"]
  );

  Map<String, dynamic> toJson() => {
    "tran_time": tranTime.toIso8601String(),
    "amount": amount,
    "payment_method": paymentMethod,
    "trxId": trxId,
    "payer_acc_no": mobile,
    "invoice_number": invoiceNumber,
    "description": description,
    'logo_url': logoLink
  };
}

