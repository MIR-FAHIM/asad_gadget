// To parse this JSON data, do
//
//     final getOrderModel = getOrderModelFromJson(jsonString);

import 'dart:convert';

GetOrderModel getOrderModelFromJson(String str) => GetOrderModel.fromJson(json.decode(str));

String getOrderModelToJson(GetOrderModel data) => json.encode(data.toJson());

class GetOrderModel {
  String? status;
  List<OrderData>? orders;

  GetOrderModel({
     this.status,
     this.orders,
  });

  factory GetOrderModel.fromJson(Map<String, dynamic> json) => GetOrderModel(
    status: json["status"],
    orders: List<OrderData>.from(json["orders"].map((x) => OrderData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "orders": List<dynamic>.from(orders!.map((x) => x.toJson())),
  };
}

class OrderData {
  int id;
  int cartId;
  int userId;
  String note;
  int shopId;
  dynamic attachment;
  int totalProduct;
  String totalAmount;
  String status;
  int isDelivered;
  dynamic type;
  DateTime createdAt;
  DateTime updatedAt;

  OrderData({
    required this.id,
    required this.cartId,
    required this.userId,
    required this.note,
    required this.shopId,
    required this.attachment,
    required this.totalProduct,
    required this.totalAmount,
    required this.status,
    required this.isDelivered,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
    id: json["id"],
    cartId: json["cart_id"],
    userId: json["user_id"],
    note: json["note"]?? "No Data",
    shopId: json["shop_id"],
    attachment: json["attachment"],
    totalProduct: json["total_product"],
    totalAmount: json["total_amount"],
    status: json["status"],
    isDelivered: json["is_delivered"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cart_id": cartId,
    "user_id": userId,
    "note": note,
    "shop_id": shopId,
    "attachment": attachment,
    "total_product": totalProduct,
    "total_amount": totalAmount,
    "status": status,
    "is_delivered": isDelivered,
    "type": type,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
