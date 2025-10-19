// To parse this JSON data, do
//
//     final fetchBpdbModel = fetchBpdbModelFromJson(jsonString);

import 'dart:convert';

FetchBpdbModel fetchBpdbModelFromJson(String str) => FetchBpdbModel.fromJson(json.decode(str));

String fetchBpdbModelToJson(FetchBpdbModel data) => json.encode(data.toJson());

class FetchBpdbModel {
  String? result;
  BillRef? billRef;
  Data? data;

  FetchBpdbModel({
     this.result,
     this.billRef,
     this.data,
  });

  factory FetchBpdbModel.fromJson(Map<String, dynamic> json) => FetchBpdbModel(
    result: json["result"],
    billRef: BillRef.fromJson(json["bill_ref"]),
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "bill_ref": billRef!.toJson(),
    "data": data!.toJson(),
  };
}

class BillRef {
  int billPaymentId;
  String billReferId;

  BillRef({
    required this.billPaymentId,
    required this.billReferId,
  });

  factory BillRef.fromJson(Map<String, dynamic> json) => BillRef(
    billPaymentId: json["bill_payment_id"],
    billReferId: json["bill_refer_id"],
  );

  Map<String, dynamic> toJson() => {
    "bill_payment_id": billPaymentId,
    "bill_refer_id": billReferId,
  };
}

class Data {
  String billName;
  String billNo;
  String billerMobile;
  String billAmount;
  String charge;
  String billTotalAmount;
  String isBillPaid;
  String bllrId;
  String customerName;
  // String tarrifCode;
  // String requestedVendingAmount;
  // String arrearDeductionAmount;
  // String feesAmount;
  // String engAmount;

  Data({
    required this.billName,
    required this.billNo,
    required this.billerMobile,
    required this.billAmount,
    required this.charge,
    required this.billTotalAmount,
    required this.isBillPaid,
    required this.bllrId,
    required this.customerName,
    // required this.tarrifCode,
    // required this.requestedVendingAmount,
    // required this.arrearDeductionAmount,
    // required this.feesAmount,
    // required this.engAmount,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    billName: json["bill_name"],
    billNo: json["bill_no"],
    billerMobile: json["biller_mobile"],
    billAmount: json["bill_amount"],
    charge: json["charge"],
    billTotalAmount: json["bill_total_amount"],
    isBillPaid: json["is_bill_paid"],
    bllrId: json["bllr_id"],
    customerName: json["customer_name"],
    // tarrifCode: json["tarrif_code"],
    // requestedVendingAmount: json["requested_vending_amount"],
    // arrearDeductionAmount: json["arrear_deduction_amount"],
    // feesAmount: json["fees_amount"],
    // engAmount: json["eng_amount"],
  );

  Map<String, dynamic> toJson() => {
    "bill_name": billName,
    "bill_no": billNo,
    "biller_mobile": billerMobile,
    "bill_amount": billAmount,
    "charge": charge,
    "bill_total_amount": billTotalAmount,
    "is_bill_paid": isBillPaid,
    "bllr_id": bllrId,
    "customer_name": customerName,
    // "tarrif_code": tarrifCode,
    // "requested_vending_amount": requestedVendingAmount,
    // "arrear_deduction_amount": arrearDeductionAmount,
    // "fees_amount": feesAmount,
    // "eng_amount": engAmount,
  };
}
