// To parse this JSON data, do
//
//     final getCategoryModel = getCategoryModelFromJson(jsonString);

import 'dart:convert';

GetCategoryModel getCategoryModelFromJson(String str) => GetCategoryModel.fromJson(json.decode(str));

String getCategoryModelToJson(GetCategoryModel data) => json.encode(data.toJson());

class GetCategoryModel {
  String? status;
  String? message;
  List<DatumCategory>? data;

  GetCategoryModel({
     this.status,
     this.message,
     this.data,
  });

  factory GetCategoryModel.fromJson(Map<String, dynamic> json) => GetCategoryModel(
    status: json["status"],
    message: json["message"],
    data: List<DatumCategory>.from(json["data"].map((x) => DatumCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumCategory {
  int id;
  String name;
  int isActive;
  String details;
  String imageUrl;
  DateTime createdAt;
  DateTime updatedAt;

  DatumCategory({
    required this.id,
    required this.name,
    required this.isActive,
    required this.details,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DatumCategory.fromJson(Map<String, dynamic> json) => DatumCategory(
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
