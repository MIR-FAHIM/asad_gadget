class AccountStatementModel {
  String? result;
  List<Data>? data;

  AccountStatementModel({this.result, this.data});

  AccountStatementModel.fromJson(Map<String, dynamic> json) {
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
  int? type_id;
  String? transaction_name;
  String? transaction_time;
  dynamic trx_id;
  String? amount;
  String? new_balance;
  String? transaction_name_color;
  String? amount_color;
  String? icon;

  Data({
    this.type_id,
    this.transaction_name,
    this.transaction_time,
    this.trx_id,
    this.amount,
    this.new_balance,
    this.transaction_name_color,
    this.amount_color,
    this.icon,
  });

  Data.fromJson(Map<String, dynamic> json) {
    type_id = json['type_id'];
    transaction_name = json['transaction_name'];
    transaction_time = json['transaction_time'];
    trx_id = json['trx_id'];
    amount = json['amount'];
    new_balance = json['new_balance'];
    transaction_name_color = json['transaction_name_color'];
    amount_color = json['amount_color'];
    icon = json['icon'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_id'] = this.type_id;
    data['transaction_name'] = this.transaction_name;
    data['transaction_time'] = this.transaction_time;
    data['trx_id'] = this.trx_id;
    data['amount'] = this.amount;
    data['new_balance'] = this.new_balance;
    data['transaction_name_color'] = this.transaction_name_color;
    data['amount_color'] = this.amount_color;
    data['icon'] = this.icon;
    return data;
  }
}
