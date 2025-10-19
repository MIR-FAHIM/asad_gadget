class BarcodeProductModel {
  String? result;
  String? message;
  List<BarcodeProductData>? data;

  BarcodeProductModel({this.result, this.message, this.data});

  BarcodeProductModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BarcodeProductData>[];
      json['data'].forEach((v) {
        data!.add(BarcodeProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BarcodeProductData {
  int? id;
  String? companyId;
  String? name;
  int? quantity;
  int? stockAlert;
  int? buyingPrice;
  int? sellingPrice;
  int? discountPercent;
  int? vatPercent;
  String? expireDate;
  String? barcode;
  String? details;
  int? idCat;
  int? idSubcat;
  int? idUnit;
  String? size;
  String? color;
  String? image;
  int? idMerchant;
  int? isActive;
  String? createdAt;
  int? createdBy;
  String? updatedAt;
  int? updatedBy;
  String? category;
  String? subcategory;
  String? unit;
  String? companyName;

  BarcodeProductData(
      {this.id,
      this.companyId,
      this.name,
      this.quantity,
      this.stockAlert,
      this.buyingPrice,
      this.sellingPrice,
      this.discountPercent,
      this.vatPercent,
      this.expireDate,
      this.barcode,
      this.details,
      this.idCat,
      this.idSubcat,
      this.idUnit,
      this.size,
      this.color,
      this.image,
      this.idMerchant,
      this.isActive,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.category,
      this.subcategory,
      this.unit,
      this.companyName});

  BarcodeProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    name = json['name'];
    quantity = json['quantity'];
    stockAlert = json['stock_alert'];
    buyingPrice = json['buying_price'];
    sellingPrice = json['selling_price'];
    discountPercent = json['discount_percent'];
    vatPercent = json['vat_percent'];
    expireDate = json['expire_date'];
    barcode = json['barcode'];
    details = json['details'];
    idCat = json['id_cat'];
    idSubcat = json['id_subcat'];
    idUnit = json['id_unit'];
    size = json['size'];
    color = json['color'];
    image = json['image'];
    idMerchant = json['id_merchant'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    category = json['category'];
    subcategory = json['subcategory'];
    unit = json['unit'];
    companyName = json['company_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['company_id'] = companyId;
    data['name'] = name;
    data['quantity'] = quantity;
    data['stock_alert'] = stockAlert;
    data['buying_price'] = buyingPrice;
    data['selling_price'] = sellingPrice;
    data['discount_percent'] = discountPercent;
    data['vat_percent'] = vatPercent;
    data['expire_date'] = expireDate;
    data['barcode'] = barcode;
    data['details'] = details;
    data['id_cat'] = idCat;
    data['id_subcat'] = idSubcat;
    data['id_unit'] = idUnit;
    data['size'] = size;
    data['color'] = color;
    data['image'] = image;
    data['id_merchant'] = idMerchant;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    data['updated_at'] = updatedAt;
    data['updated_by'] = updatedBy;
    data['category'] = category;
    data['subcategory'] = subcategory;
    data['unit'] = unit;
    data['company_name'] = companyName;
    return data;
  }
}
