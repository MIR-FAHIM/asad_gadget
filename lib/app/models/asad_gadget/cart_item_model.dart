// To parse this JSON data, do
//
//     final getCartItemModel = getCartItemModelFromJson(jsonString);

import 'dart:convert';

GetCartItemModel getCartItemModelFromJson(String str) => GetCartItemModel.fromJson(json.decode(str));

String getCartItemModelToJson(GetCartItemModel data) => json.encode(data.toJson());

class GetCartItemModel {
  String? status;
  List<Item>? items;

  GetCartItemModel({
     this.status,
     this.items,
  });

  factory GetCartItemModel.fromJson(Map<String, dynamic> json) => GetCartItemModel(
    status: json["status"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
  };

  double getTotalCartPrice() {
    if (items == null || items!.isEmpty) {
      return 0.0;
    }

    double total = 0.0;
    for (var item in items!) {
      total += double.tryParse(item.cartPrice) ?? 0.0;
    }
    return total;
  }
}

class Item {
  int id;
  int cartId;
  int productId;
  int quantity;
  String cartPrice;
  String? type;
  String status;
  int shopId;
  int isActive;
  DateTime createdAt;
  DateTime updatedAt;
  String productName;
  String productImage;
  String basePrice;
  String discount;
  String productPrice;

  Item({
    required this.id,
    required this.cartId,
    required this.productId,
    required this.quantity,
    required this.cartPrice,
    required this.type,
    required this.status,
    required this.shopId,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.productName,
    required this.productImage,
    required this.basePrice,
    required this.discount,
    required this.productPrice,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    cartId: json["cart_id"],
    productId: json["product_id"],
    quantity: json["quantity"],
    cartPrice: json["cart_price"],
    type: json["type"],
    status: json["status"],
    shopId: json["shop_id"],
    isActive: json["is_active"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    productName: json["product_name"],
    productImage: json["product_image"] ?? 'No Data',
    basePrice: json["base_price"],
    discount: json["discount"],
    productPrice: json["product_price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cart_id": cartId,
    "product_id": productId,
    "quantity": quantity,
    "cart_price": cartPrice,
    "type": type,
    "status": status,
    "shop_id": shopId,
    "is_active": isActive,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "product_name": productName,
    "product_image": productImage,
    "base_price": basePrice,
    "discount": discount,
    "product_price": productPrice,
  };
}
