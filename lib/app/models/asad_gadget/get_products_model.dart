// To parse this JSON data, do
//
//     final getProductsModel = getProductsModelFromJson(jsonString);

import 'dart:convert';

GetProductsModel getProductsModelFromJson(String str) => GetProductsModel.fromJson(json.decode(str));

String getProductsModelToJson(GetProductsModel data) => json.encode(data.toJson());

class GetProductsModel {
  String? status;
  String? message;
  List<DatumProducts>? data;

  GetProductsModel({
     this.status,
     this.message,
     this.data,
  });

  factory GetProductsModel.fromJson(Map<String, dynamic> json) => GetProductsModel(
    status: json["status"],
    message: json["message"],
    data: List<DatumProducts>.from(json["data"].map((x) => DatumProducts.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumProducts {
  int id;
  String name;
  int isActive;
  String description;
  int categoryId;
  int brandId;
  int typeId;
  int varriantId;
  int relatedProductId;
  int stockCount;
  String productImage;
  String basePrice;
  String discount;
  String productPrice;
  DateTime createdAt;
  DateTime updatedAt;

  DatumProducts({
    required this.id,
    required this.name,
    required this.isActive,
    required this.description,
    required this.categoryId,
    required this.brandId,
    required this.typeId,
    required this.varriantId,
    required this.relatedProductId,
    required this.stockCount,
    required this.productImage,
    required this.basePrice,
    required this.discount,
    required this.productPrice,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DatumProducts.fromJson(Map<String, dynamic> json) => DatumProducts(
    id: json["id"],
    name: json["name"] ?? 'No Data',
    isActive: json["is_active"],
    description: json["description"] ?? 'No Data',
    categoryId: json["category_id"]?? 0,
    brandId: json["brand_id"] ?? 0,
    typeId: json["type_id"]?? 0,
    varriantId: json["varriant_id"]?? 0,
    relatedProductId: json["related_product_id"]?? 0,
    stockCount: json["stock_count"]?? 0,
    productImage: json["product_image"] ?? 'No Data',
    basePrice: json["base_price"]?? 0,
    discount: json["discount"]?? 0,
    productPrice: json["product_price"]?? 0,
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_active": isActive,
    "description": description,
    "category_id": categoryId,
    "brand_id": brandId,
    "type_id": typeId,
    "varriant_id": varriantId,
    "related_product_id": relatedProductId,
    "stock_count": stockCount,
    "product_image": productImage,
    "base_price": basePrice,
    "discount": discount,
    "product_price": productPrice,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
