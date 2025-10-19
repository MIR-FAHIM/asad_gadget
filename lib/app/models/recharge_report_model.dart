class RechargeReportModel {
  List<RechargeData>? data;
  String? result;

  RechargeReportModel({this.data, this.result});

  RechargeReportModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <RechargeData>[];
      json['data'].forEach((v) {
        data!.add(new RechargeData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class RechargeData {
  int? customerId;
  String? customerMobileNumber;
  String? requestTime;
  String? rechargeTime;
  String? operator;
  String? rechargeMobileNumber;
  String? beforeBalance;
  String? afterBalance;
  int? rechargeAmount;
  String? requestStatus;
  String? referId;
  String? status;
  String? transactionId;
  String? otfComission;

  RechargeData(
      {this.customerId,
      this.customerMobileNumber,
      this.requestTime,
      this.rechargeTime,
      this.operator,
      this.rechargeMobileNumber,
      this.beforeBalance,
      this.afterBalance,
      this.rechargeAmount,
      this.requestStatus,
      this.referId,
      this.status,
      this.transactionId,
      this.otfComission});

  RechargeData.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    customerMobileNumber = json['customer_mobile_number'];
    requestTime = json['request_time'];
    rechargeTime = json['recharge_time'];
    operator = json['Operator'];
    rechargeMobileNumber = json['recharge_mobile_number'];
    beforeBalance = json['before_balance'];
    afterBalance = json['after_balance'];
    rechargeAmount = json['recharge_amount'] == null ? 0 : json['recharge_amount'] ;
    requestStatus = json['request_status'];
    referId = json['refer_id'];
    status = json['status'];
    transactionId = json['transaction_id'];
    otfComission = json['Otf_comission'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['customer_mobile_number'] = this.customerMobileNumber;
    data['request_time'] = this.requestTime;
    data['recharge_time'] = this.rechargeTime;
    data['Operator'] = this.operator;
    data['recharge_mobile_number'] = this.rechargeMobileNumber;
    data['before_balance'] = this.beforeBalance;
    data['after_balance'] = this.afterBalance;
    data['recharge_amount'] = this.rechargeAmount;
    data['request_status'] = this.requestStatus;
    data['refer_id'] = this.referId;
    data['status'] = this.status;
    data['transaction_id'] = this.transactionId;
    data['Otf_comission'] = this.otfComission;
    return data;
  }
}
