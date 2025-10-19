class BillPayDetails {
  String? result;
  BillPayDetailsData? data;

  BillPayDetails({this.result, this.data});

  BillPayDetails.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? new BillPayDetailsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class BillPayDetailsData {
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
  String? logo;
  String? paymentDate;
  String? createdAt;

  BillPayDetailsData(
      {this.id,
      this.billerType,
      this.billName,
      this.billNo,
      this.billerAccNo,
      this.billerMobile,
      this.billFrom,
      this.billTo,
      this.billGenDate,
      this.billDueDate,
        this.logo,
      this.charge,
      this.billTotalAmount,
      this.paymentStatus,
      this.transactionId,
      this.paymentDate,
      this.createdAt});

  BillPayDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    billerType = json['biller_type'];
    billName = json['bill_name'];
    billNo = json['bill_no']?? "No Data";
    billerAccNo = json['biller_acc_no']?? "No Data";
    billerMobile = json['biller_mobile']?? "No Data";
    billFrom = json['bill_from'];
    billTo = json['bill_to'];
    billGenDate = json['bill_gen_date'];
    billDueDate = json['bill_due_date'];
    logo = json['logo_url'];
    charge = json['charge']?? "No Data";
    billTotalAmount = json['bill_total_amount'];
    paymentStatus = json['payment_status'];
    transactionId = json['transaction_id'];
    paymentDate = json['payment_date'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['biller_type'] = this.billerType;
    data['bill_name'] = this.billName;
    data['bill_no'] = this.billNo;
    data['logo_url'] = this.logo;
    data['biller_acc_no'] = this.billerAccNo;
    data['biller_mobile'] = this.billerMobile;
    data['bill_from'] = this.billFrom;
    data['bill_to'] = this.billTo;
    data['bill_gen_date'] = this.billGenDate;
    data['bill_due_date'] = this.billDueDate;
    data['charge'] = this.charge;
    data['bill_total_amount'] = this.billTotalAmount;
    data['payment_status'] = this.paymentStatus;
    data['transaction_id'] = this.transactionId;
    data['payment_date'] = this.paymentDate;
    data['created_at'] = this.createdAt;
    return data;
  }
}
