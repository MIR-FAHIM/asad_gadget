class TransactionReportModel {
  String? result;
  List<Data>? data;

  TransactionReportModel({this.result, this.data});

  TransactionReportModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? sender;
  var senderPreBalance;
  var senderNewBalance;
  var receiverPreBalance;
  var receiverNewBalance;
  var amount;
  String? trxTime;
  String? trxName;
  String? trxId;
  String? invoiceNumber;
  String? paymentMethod;
  var trxTypeId;
  var sl;
  var preBalance;
  var newBalance;

  Data(
      {this.sender,
      this.senderPreBalance,
      this.senderNewBalance,
      this.receiverPreBalance,
      this.receiverNewBalance,
      this.amount,
      this.trxTime,
      this.trxName,
      this.trxId,
      this.invoiceNumber,
      this.paymentMethod,
      this.trxTypeId,
      this.sl,
      this.preBalance,
      this.newBalance});

  Data.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    senderPreBalance = json['sender_pre_balance'];
    senderNewBalance = json['sender_new_balance'];
    receiverPreBalance = json['receiver_pre_balance'];
    receiverNewBalance = json['receiver_new_balance'];
    amount = json['amount'];
    trxTime = json['trx_time'];
    trxName = json['trx_name'];
    trxId = json['trxId'];
    invoiceNumber = json['invoice_number'];
    paymentMethod = json['payment_method'];
    trxTypeId = json['trx_type_id'];
    sl = json['sl'];
    preBalance = json['pre_balance'];
    newBalance = json['new_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender'] = this.sender;
    data['sender_pre_balance'] = this.senderPreBalance;
    data['sender_new_balance'] = this.senderNewBalance;
    data['receiver_pre_balance'] = this.receiverPreBalance;
    data['receiver_new_balance'] = this.receiverNewBalance;
    data['amount'] = this.amount;
    data['trx_time'] = this.trxTime;
    data['trx_name'] = this.trxName;
    data['trxId'] = this.trxId;
    data['invoice_number'] = this.invoiceNumber;
    data['payment_method'] = this.paymentMethod;
    data['trx_type_id'] = this.trxTypeId;
    data['sl'] = this.sl;
    data['pre_balance'] = this.preBalance;
    data['new_balance'] = this.newBalance;
    return data;
  }
}
