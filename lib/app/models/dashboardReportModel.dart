// To parse this JSON data, do
//
//     final dahsboardReportModel = dahsboardReportModelFromJson(jsonString);

import 'dart:convert';

DahsboardReportModel dahsboardReportModelFromJson(String str) => DahsboardReportModel.fromJson(json.decode(str));

String dahsboardReportModelToJson(DahsboardReportModel data) => json.encode(data.toJson());

class DahsboardReportModel {
  String? result;
  String? paymentCollection;
  String? rechargeAmount;
  String? billPayment;
  String? mbanking;
  List<MbankingTotal>? mbankingTotal;

  DahsboardReportModel({
     this.result,
     this.paymentCollection,
     this.rechargeAmount,
     this.billPayment,
     this.mbanking,
     this.mbankingTotal,
  });

  factory DahsboardReportModel.fromJson(Map<String, dynamic> json) => DahsboardReportModel(
    result: json["result"],
    paymentCollection: json["payment_collection"] ?? "0.0",
    rechargeAmount: json["recharge_amount"] == "null" ? "0.0":json["recharge_amount"],
    billPayment: json["bill_payment"]?? "0",
    mbanking: json["mbanking"].toString() ,
    mbankingTotal: List<MbankingTotal>.from(json["mbankingTotal"].map((x) => MbankingTotal.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "payment_collection": paymentCollection,
    "recharge_amount": rechargeAmount,
    "bill_payment": billPayment,
    "mbanking": mbanking,
    "mbankingTotal": List<dynamic>.from(mbankingTotal!.map((x) => x.toJson())),
  };
}

class MbankingTotal {
  String? mfsName;
  String? totalAmount;

  MbankingTotal({
     this.mfsName,
     this.totalAmount,
  });

  factory MbankingTotal.fromJson(Map<String, dynamic> json) => MbankingTotal(
    mfsName: json["mfs_name"],
    totalAmount: json["total_amount"],
  );

  Map<String, dynamic> toJson() => {
    "mfs_name": mfsName,
    "total_amount": totalAmount,
  };
}
