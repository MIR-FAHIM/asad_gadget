class TransactionVerifyPaymentModel {
  int? id;
  String? code;
  String? name;
  String? logo;
  String? charge;

  TransactionVerifyPaymentModel({this.id, this.code, this.name, this.logo, this.charge});

  TransactionVerifyPaymentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    logo = json['logo'];
    charge = json['charge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['logo'] = logo;
    data['charge'] = charge;
    return data;
  }
}
