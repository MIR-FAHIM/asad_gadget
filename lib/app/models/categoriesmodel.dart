class CategoriesModel {
  String? result;
  List<CategoriesData>? data;
  String? message;

  CategoriesModel({this.result, this.data, this.message});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = <CategoriesData>[];
      json['data'].forEach((v) {
        data!.add(CategoriesData.fromJson(v));
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

class CategoriesData {
  int? id;
  String? name;
  int? idMerchant;
  int? isActive;
  String? createdAt;
  int? createdBy;
  String? updatedAt;
  String? updatedBy;

  CategoriesData(
      {this.id,
      this.name,
      this.idMerchant,
      this.isActive,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy});

  CategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    idMerchant = json['id_merchant'];
    isActive = json['is_active'];
    createdAt = json['created_at'] ?? '';
    createdBy = json['created_by'] ?? '';
    updatedAt = json['updated_at'] ?? '';
    updatedBy = json['updated_by'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['id_merchant'] = idMerchant;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    data['updated_at'] = updatedAt;
    data['updated_by'] = updatedBy;
    return data;
  }
}

class SubCategoriesModel {
  String? result;
  List<SubCategoriesData>? data;

  SubCategoriesModel({this.result, this.data});

  SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = <SubCategoriesData>[];
      json['data'].forEach((v) {
        data!.add(SubCategoriesData.fromJson(v));
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

class SubCategoriesData {
  int? id;
  int? idCat;
  String? name;
  int? idMerchant;
  int? isActive;
  String? createdAt;
  int? createdBy;
  String? updatedAt;
  int? updatedBy;

  SubCategoriesData(
      {this.id,
      this.idCat,
      this.name,
      this.idMerchant,
      this.isActive,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy});

  SubCategoriesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idCat = json['id_cat'];
    name = json['name'];
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
    data['id_cat'] = idCat;
    data['name'] = name;
    data['id_merchant'] = idMerchant;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    data['updated_at'] = updatedAt;
    data['updated_by'] = updatedBy;
    return data;
  }
}
