class BillPayHistory {
  String? result;
  List<BillPayHistoryData>? data;

  BillPayHistory({this.result, this.data});

  BillPayHistory.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = <BillPayHistoryData>[];
      json['data'].forEach((v) {
        data!.add(BillPayHistoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BillPayHistoryData {
  int? id;
  String? billerType;
  String? billName;
  String? billNo;
  String? billerAccNo;
  String? billerMobile;
  String? billFrom;
  String? billTo;
  String? billGenDate;
  String? billDueDate;
  String? charge;
  String? billTotalAmount;
  String? paymentStatus;
  String? transactionId;
  String? paymentDate;
  String? createdAt;
  String? logo_url;
  String? token;

  BillPayHistoryData(
      {this.id,
      this.billerType,
      this.billName,
      this.billNo,
      this.logo_url,
      this.billerAccNo,
      this.billerMobile,
      this.billFrom,
      this.billTo,
      this.billGenDate,
      this.billDueDate,
      this.charge,
      this.billTotalAmount,
      this.paymentStatus,
      this.transactionId,
      this.paymentDate,
      this.token,
      this.createdAt});

  BillPayHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    billerType = json['biller_type'];
    billName = json['bill_name'];
    billNo = json['bill_no'];
    billerAccNo = json['biller_acc_no'] ?? "No Data";
    billerMobile = json['biller_mobile'] ?? "No Data";
    billFrom = json['bill_from'];
    billTo = json['bill_to'];
    billGenDate = json['bill_gen_date'];
    billDueDate = json['bill_due_date'];
    charge = json['charge'];
    billTotalAmount = json['bill_total_amount'];
    paymentStatus = json['payment_status'];
    transactionId = json['transaction_id'];
    paymentDate = json['payment_date'];
    createdAt = json['created_at'];
    token = json['token'] ?? "No Token";
    logo_url = json['logo_url'] ??
        "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder.svg/330px-No-Image-Placeholder.svg.png?20200912122019";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['biller_type'] = this.billerType;
    data['bill_name'] = this.billName;
    data['bill_no'] = this.billNo;
    data['biller_acc_no'] = this.billerAccNo;
    data['biller_mobile'] = this.billerMobile;
    data['bill_from'] = this.billFrom;
    data['bill_to'] = this.billTo;
    data['bill_gen_date'] = this.billGenDate;
    data['bill_due_date'] = this.billDueDate;
    data['charge'] = this.charge;
    data['token'] = this.token;
    data['logo_url'] = this.logo_url;
    data['bill_total_amount'] = this.billTotalAmount;
    data['payment_status'] = this.paymentStatus;
    data['transaction_id'] = this.transactionId;
    data['payment_date'] = this.paymentDate;
    data['created_at'] = this.createdAt;
    return data;
  }
}
