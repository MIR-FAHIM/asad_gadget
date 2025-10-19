// To parse this JSON data, do
//
//     final getBrandModel = getBrandModelFromJson(jsonString);

import 'dart:convert';

GetBrandModel getBrandModelFromJson(String str) => GetBrandModel.fromJson(json.decode(str));

String getBrandModelToJson(GetBrandModel data) => json.encode(data.toJson());

class GetBrandModel {
  String? status;
  String? message;
  List<DatumBrand>? data;

  GetBrandModel({
     this.status,
     this.message,
     this.data,
  });

  factory GetBrandModel.fromJson(Map<String, dynamic> json) => GetBrandModel(
    status: json["status"],
    message: json["message"],
    data: List<DatumBrand>.from(json["data"].map((x) => DatumBrand.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumBrand {
  int id;
  String name;
  int isActive;
  String details;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;

  DatumBrand({
    required this.id,
    required this.name,
    required this.isActive,
    required this.details,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DatumBrand.fromJson(Map<String, dynamic> json) => DatumBrand(
    id: json["id"],
    name: json["name"],
    isActive: json["is_active"],
    details: json["details"],
    imageUrl: json["image_url"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "is_active": isActive,
    "details": details,
    "image_url": imageUrl,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
