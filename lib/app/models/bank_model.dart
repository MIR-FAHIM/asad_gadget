class BankModel {
  int? id;
  String? bankName;

  BankModel({this.id, this.bankName});

  BankModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bankName = json['bank_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bank_name'] = this.bankName;
    return data;
  }
}
