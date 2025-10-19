class ShopInfoModel {
  String? result;
  String? message;
  ShopInfo? shopdata;

  ShopInfoModel({this.result, this.message, this.shopdata});

  ShopInfoModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    shopdata = json['data'] != null ? ShopInfo.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    if (shopdata != null) {
      data['data'] = shopdata!.toJson();
    }
    return data;
  }
}

class ShopInfo {
  int? id;
  String? shopName;
  String? address;
  String? licenseNo;
  String? vatRegNo;
  int? divisionId;
  int? districtId;
  int? upazilaId;
  String? unionId;
  String? postCode;
  String? policyPlan;
  int? idMerchant;
  int? isActive;
  String? createdAt;
  int? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? division;
  String? district;
  String? upazila;

  ShopInfo(
      {this.id,
      this.shopName,
      this.address,
      this.licenseNo,
      this.vatRegNo,
      this.divisionId,
      this.districtId,
      this.upazilaId,
      this.unionId,
      this.postCode,
      this.policyPlan,
      this.idMerchant,
      this.isActive,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.division,
      this.district,
      this.upazila});

  ShopInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopName = json['shop_name'];
    address = json['address'];
    licenseNo = json['license_no'];
    vatRegNo = json['vat_reg_no'];
    divisionId = json['division_id'];
    districtId = json['district_id'];
    upazilaId = json['upazila_id'];
    unionId = json['union_id'];
    postCode = json['post_code'];
    policyPlan = json['policy_plan'];
    idMerchant = json['id_merchant'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    division = json['division'] ?? '';
    district = json['district'];
    upazila = json['upazila'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['shop_name'] = shopName;
    data['address'] = address;
    data['license_no'] = licenseNo;
    data['vat_reg_no'] = vatRegNo;
    data['division_id'] = divisionId;
    data['district_id'] = districtId;
    data['upazila_id'] = upazilaId;
    data['union_id'] = unionId;
    data['post_code'] = postCode;
    data['policy_plan'] = policyPlan;
    data['id_merchant'] = idMerchant;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    data['updated_at'] = updatedAt;
    data['updated_by'] = updatedBy;
    data['division'] = division;
    data['district'] = district;
    data['upazila'] = upazila;
    return data;
  }
}
