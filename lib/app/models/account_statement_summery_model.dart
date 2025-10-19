class AccountStatemenSummerytModel {
  String? result;
  dynamic opening_balance;
  dynamic closing_balance;
  List<Data>? data;

  AccountStatemenSummerytModel({
    this.result,
    this.opening_balance,
    this.closing_balance,
    this.data,
  });

  AccountStatemenSummerytModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    opening_balance = json['opening_balance'] ?? 0;
    closing_balance = json['closing_balance'] ?? 0;
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
    data['opening_balance'] = this.opening_balance;
    data['closing_balance'] = this.closing_balance;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? type_id;
  String? transaction_name;

  dynamic number_of_trx;
  dynamic amount;
  String? transaction_name_color;
  String? amount_color;
  String? icon;

  Data({
    this.type_id,
    this.transaction_name,
    this.number_of_trx,
    this.amount,
    this.transaction_name_color,
    this.amount_color,
    this.icon,
  });

  Data.fromJson(Map<String, dynamic> json) {
    type_id = json['type_id'];
    transaction_name = json['transaction_name'];

    number_of_trx = json['number_of_trx'];
    amount = json['amount'];

    transaction_name_color = json['transaction_name_color'];
    amount_color = json['amount_color'];
    icon = json['icon'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type_id'] = this.type_id;
    data['transaction_name'] = this.transaction_name;

    data['number_of_trx'] = this.number_of_trx;
    data['amount'] = this.amount;

    data['transaction_name_color'] = this.transaction_name_color;
    data['amount_color'] = this.amount_color;
    data['icon'] = this.icon;
    return data;
  }
}
