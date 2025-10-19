class DailyReportModel {
  String? customer_name;
  String? mobile_no;
  String? opening_balance;
  String? receive_balance;
  String? online_receive_balance;
  String? recharge_amount;
  String? commission;
  String? otf;
  String? bill_pay_amount;
  String? recharge_commission;
  String? ticket_commission;
  String? bill_pay_commission;
  String? mbanking_commission;
  String? total_commision;
  String? daily_charge;
  String? closing_balance;
  String? totalCashIn;
  String? totalCashOut;
  String? ticketPurchase;
  String? packagePurchase;
  String? totalAddBalance;

  DailyReportModel({
    this.customer_name,
    this.mobile_no,
    this.opening_balance,
    this.totalCashIn,
    this.totalCashOut,
    this.receive_balance,
    this.online_receive_balance,
    this.recharge_amount,
    this.commission,
    this.otf,
    this.mbanking_commission,
    this.ticket_commission,
    this.recharge_commission,
    this.total_commision,
    this.bill_pay_amount,
    this.bill_pay_commission,
    this.daily_charge,
    this.closing_balance,
    this.packagePurchase,
    this.ticketPurchase,
    this.totalAddBalance,
  });

  DailyReportModel.fromJson(Map<String, dynamic> json) {
    customer_name = json['customer_name'];
    mobile_no = json['mobile_no'];
    opening_balance = json['opening_balance'];
    receive_balance = json['receive_balance'];
    totalCashIn = json['total_cash_in'].toString();
    totalCashOut = json['total_cash_out'].toString();

    recharge_commission = json['commission'];
    mbanking_commission = json['mbanking_commission'].toString();
    ticket_commission = json['ticket_purchase_commission'].toString();
    bill_pay_commission = json['bill_pay_commission'].toString();
    total_commision = json['total_commission'].toString();

    online_receive_balance = json['online_receive_balance'];
    recharge_amount = json['recharge_amount'];
    commission = json['commission'];
    otf = json['otf'];
    bill_pay_amount = json['bill_pay_amount'];
    bill_pay_commission = json['bill_pay_commission'];
    daily_charge = json['daily_charge'];
    closing_balance = json['closing_balance'];
    packagePurchase = json['package_purchase'];
    ticketPurchase = json['ticket_purchase'];
    totalAddBalance = json['total_add_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_name'] = this.customer_name;
    data['mobile_no'] = this.mobile_no;
    data['opening_balance'] = this.opening_balance;
    data['receive_balance'] = this.receive_balance;
    data['online_receive_balance'] = this.online_receive_balance;
    data['recharge_amount'] = this.recharge_amount;
    data['commission'] = this.commission;
    data['total_cash_in'] = this.totalCashIn;
    data['total_cash_out'] = this.totalCashOut;
    data['otf'] = this.otf;

    data['commission'] = this.recharge_commission;
    data['mbanking_commission'] = this.mbanking_commission;
    data['ticket_purchase_commission'] = this.ticket_commission;
    data['bill_pay_commission'] = this.mbanking_commission;
    data['total_commission'] = this.total_commision;
    data['total_add_balance'] = this.totalAddBalance;

    return data;
  }
}
