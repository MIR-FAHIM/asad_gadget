class MFSPaymentTypeModel {
  int? id;
  String? code;
  String? name;
  String? logo;
  String? charge;

  MFSPaymentTypeModel({
    this.id,
    this.code,
    this.name,
    this.logo,
    this.charge,
  });

  MFSPaymentTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    logo = json['logo_link'];
    charge = json['charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['logo_link'] = this.logo;
    data['charge'] = this.charge;
    return data;
  }
}
class BankkPaymentTypeModel {
  int? id;
  String? code;
  String? name;
  String? logo;


  BankkPaymentTypeModel({
    this.id,
    this.code,
    this.name,
    this.logo,

  });

  BankkPaymentTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    logo = json['logo_link'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['logo_link'] = this.logo;

    return data;
  }
}

class BankChargeListModel {

  String? amount;
  String? charge;


  BankChargeListModel({
    this.amount,
    this.charge,

  });

  BankChargeListModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    charge = json['charge'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['amount'] = this.amount;
    data['charge'] = this.charge;

    return data;
  }
}
