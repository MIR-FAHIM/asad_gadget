class CashBackReportModel {
  List<CashbackData>? data;
  String? result;

  CashBackReportModel({this.data, this.result});

  CashBackReportModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CashbackData>[];
      json['data'].forEach((v) {
        data!.add(new CashbackData.fromJson(v));
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

class CashbackData {
  int? operatorId;
  String? operatorName;
  String? packageName;
  String? packageValidity;
  String? offerName;
  String? circle;

  String? message;
  String? offerAmount;
  dynamic cashbackAmount;

  CashbackData({
    this.operatorId,
    this.operatorName,
    this.packageName,
    this.packageValidity,
    this.message,
    this.circle,
    this.offerName,
    this.offerAmount,
    this.cashbackAmount,
  });

  CashbackData.fromJson(Map<String, dynamic> json) {
    operatorId = json['operator_id'];
    operatorName = json['operator_name'];
    packageName = json['package_name'];
    packageValidity = json['package_validity'];
    offerName = json['offer_name'];
 circle = json["circle"] ?? "";
    message = json['message'];
    offerAmount = json['offer_amount'].toString();
    cashbackAmount = json['cashback_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['operator_id'] = this.operatorId;
    data['operator_name'] = this.operatorName;
    data['package_name'] = this.packageName;
    data['package_validity'] = this.packageValidity;
    data['offer_name'] = this.offerName;

    data['message'] = this.message;
    data['offer_amount'] = this.offerAmount;
    data['cashback_amount'] = this.cashbackAmount;

    return data;
  }
}
