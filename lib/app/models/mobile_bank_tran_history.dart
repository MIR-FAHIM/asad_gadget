class MobileBankTransactionHistoryModel {
  String? result;
  List<DataHis>? data;

  MobileBankTransactionHistoryModel({this.result, this.data});

  MobileBankTransactionHistoryModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = <DataHis>[];
      json['data'].forEach((v) {
        data!.add(DataHis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataHis {
  String? typeName;
  String? mfsName;
  String? number;
  String? amount;
  String? commission;
  String? trxStatus;
  String? trxId;
  String? trxTime;
  String? amountColor;
  String? logo;

  DataHis({this.typeName, this.mfsName, this.number, this.amount, this.commission, this.trxStatus, this.trxId, this.trxTime, this.amountColor, this.logo});

  DataHis.fromJson(Map<String, dynamic> json) {
    typeName = json['type_name'] ?? '';
    mfsName = json['mfs_name'] ?? '';
    number = json['number'] ?? '';
    amount = json['amount'] ?? '';
    commission = json['commission'] ?? '';
    trxStatus = json['trx_status'] ?? '';
    trxId = json['trx_id'] ?? '';
    trxTime = json['trx_time'] ?? '';
    amountColor = json['amount_color'] ?? '';
    logo = json['logo_url'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type_name'] = typeName;
    data['mfs_name'] = mfsName;
    data['number'] = number;
    data['amount'] = amount;
    data['commission'] = commission;
    data['trx_status'] = trxStatus;
    data['trx_id'] = trxId;
    data['trx_time'] = trxTime;
    data['amount_color'] = amountColor;
    data['logo_url'] = logo;
    return data;
  }
}
