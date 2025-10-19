class VendorListModel {
  String? result;
  List<VendorData>? data;
  String? message;

  VendorListModel({this.result, this.data, this.message});

  VendorListModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = <VendorData>[];
      json['data'].forEach((v) {
        data!.add(VendorData.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class VendorData {
  int? id;
  String? name;
  String? mobile;
  String? address;
  int? idMerchant;
  int? isActive;
  String? createdAt;
  int? createdBy;
  String? updatedAt;
  int? updatedBy;

  VendorData(
      {this.id,
      this.name,
      this.mobile,
      this.address,
      this.idMerchant,
      this.isActive,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy});

  VendorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
    address = json['address'];
    idMerchant = json['id_merchant'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['mobile'] = mobile;
    data['address'] = address;
    data['id_merchant'] = idMerchant;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    data['updated_at'] = updatedAt;
    data['updated_by'] = updatedBy;
    return data;
  }
}
