class AmountOfferModel {
  int? dayOrRegular;
  String? operator;
  String? offerName;
  String? package;
  String? packageName;
  String? offerValidity;
  int? offerAmount;

  AmountOfferModel({this.dayOrRegular, this.operator, this.offerName, this.package, this.packageName, this.offerValidity, this.offerAmount});

  AmountOfferModel.fromJson(Map<String, dynamic> json) {
    dayOrRegular = json['day_or_regular'];
    operator = json['operator'];
    offerName = json['offer_name'];
    package = json['package'];
    packageName = json['package_name'];
    offerValidity = json['offer_validity'];
    offerAmount = json['offer_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day_or_regular'] = this.dayOrRegular;
    data['operator'] = this.operator;
    data['offer_name'] = this.offerName;
    data['package'] = this.package;
    data['package_name'] = this.packageName;
    data['offer_validity'] = this.offerValidity;
    data['offer_amount'] = this.offerAmount;
    return data;
  }
}
