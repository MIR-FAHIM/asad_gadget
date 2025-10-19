class ServiceFeeModel {
  String? information;
  List<ServiceFeeData>? servicefeedata;

  ServiceFeeModel({this.information, this.servicefeedata});

  ServiceFeeModel.fromJson(Map<String, dynamic> json) {
    information = json['information'];
    if (json['data'] != null) {
      servicefeedata = <ServiceFeeData>[];
      json['data'].forEach((v) {
        servicefeedata!.add(new ServiceFeeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['information'] = this.information;
    if (this.servicefeedata != null) {
      data['data'] = this.servicefeedata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceFeeData {
  int? serviceFeeTypeId;
  String? serviceFeeType;
  String? serviceFeeTypeDetails;
  String? strikeText;
  int? isDisable;

  ServiceFeeData({this.serviceFeeTypeId, this.serviceFeeType, this.serviceFeeTypeDetails, this.strikeText, this.isDisable});

  ServiceFeeData.fromJson(Map<String, dynamic> json) {
    serviceFeeTypeId = json['service_fee_type_id'];
    serviceFeeType = json['service_fee_type'];
    serviceFeeTypeDetails = json['service_fee_type_details'];
    strikeText = json['strike_text'];
    isDisable = json['is_disable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_fee_type_id'] = this.serviceFeeTypeId;
    data['service_fee_type'] = this.serviceFeeType;
    data['service_fee_type_details'] = this.serviceFeeTypeDetails;
    data['strike_text'] = this.strikeText;
    data['is_disable'] = this.isDisable;
    return data;
  }
}
