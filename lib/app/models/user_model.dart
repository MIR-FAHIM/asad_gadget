class UserModel {
  String? customerMobileNumber;
  String? personalMobile;
  String? name;
  String? outletName;
  String? outletAddress;
  String? businessType;
  String? districts;
  String? thana;
  String? union;
  String? post_code;
  String? image;

  String? openingTime;
  String? closingTime;
  String? nid;
  String? dob;
  String? imei;
  String? lati;
  String? longi;
  String? password;
  // String? operator_id;
  String? nid_front;
  String? nid_back;
  String? trade_license;
  String? trade_license2;
  String? service_fee_type;

  // String? image;

  UserModel({
    this.customerMobileNumber,
    this.personalMobile,
    this.name,
    this.image,
    this.outletName,
    this.outletAddress,
    this.businessType,
    this.districts,
    this.thana,
    this.union,
    this.post_code,
    this.openingTime,
    this.closingTime,
    this.nid,
    this.dob,
    this.imei,
    this.lati,
    this.longi,
    this.password,
    // this.operator_id,
    this.nid_front,
    this.nid_back,
    this.trade_license,
    this.trade_license2,
    this.service_fee_type,
    // this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    customerMobileNumber = json['customer_mobile_number'];
    personalMobile = json['personal_mobile'];
    name = json['name'];
    outletName = json['outlet_name'];
    outletAddress = json['outlet_address'];
    businessType = json['business_type'];
    districts = json['districts'];
    thana = json['thana'];
    union = json['union'];
    openingTime = json['opening_time'];
    closingTime = json['closing_time'];
    nid = json['nid'];
    dob = json['dob'];
    service_fee_type = json['service_fee_type'];
    post_code = json['post_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_mobile_number'] = this.customerMobileNumber;
    data['personal_mobile'] = this.personalMobile;
    data['name'] = this.name;
    data['outlet_name'] = this.outletName;
    data['outlet_address'] = this.outletAddress;
    data['business_type'] = this.businessType;
    data['districts'] = this.districts;
    data['thana'] = this.thana;
    data['union'] = this.union;
    data['post_code'] = this.post_code;
    data['opening_time'] = this.openingTime;
    data['closing_time'] = this.closingTime;
    data['nid'] = this.nid;
    data['dob'] = this.dob;
    data['imei'] = this.imei;
    data['lati'] = this.lati;
    data['longi'] = this.longi;
    data['password'] = this.password;
    // data['operator_id'] = this.operator_id;
    data['nid'] = this.nid;
    data['nid_front'] = this.nid_front;
    data['nid_back'] = this.nid_back;
    data['trade_license'] = this.trade_license;
    data['trade_license2'] = this.trade_license2;
    data['service_fee_type'] = this.service_fee_type;
    // data['image'] = this.image;
    return data;
  }
}
