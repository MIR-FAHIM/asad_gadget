// To parse this JSON data, do
//
//     final getShopListModel = getShopListModelFromJson(jsonString);

import 'dart:convert';

GetShopListModel getShopListModelFromJson(String str) => GetShopListModel.fromJson(json.decode(str));

String getShopListModelToJson(GetShopListModel data) => json.encode(data.toJson());

class GetShopListModel {
  String? status;
  List<DatumShop>? data;

  GetShopListModel({
    this.status,
     this.data,
  });

  factory GetShopListModel.fromJson(Map<String, dynamic> json) => GetShopListModel(
    status: json["status"],
    data: List<DatumShop>.from(json["data"].map((x) => DatumShop.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumShop {
  int id;
  String name;
  String email;
  String userType;
  String phone;
  String address;
  dynamic emailVerifiedAt;
  dynamic twoFactorConfirmedAt;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  DateTime createdAt;
  DateTime updatedAt;
  int? districtId;
  int? upozelaId;
  int? areaId;
  int? userId;
  double? latitude;
  double? longitude;
  String appToken;
  String fcmToken;
  String profilePhotoUrl;

  DatumShop({
    required this.id,
    required this.name,
    required this.email,
    required this.userType,
    required this.phone,
    required this.address,
    required this.emailVerifiedAt,
    required this.twoFactorConfirmedAt,
    required this.currentTeamId,
    required this.profilePhotoPath,
    required this.createdAt,
    required this.updatedAt,
     this.districtId,
     this.upozelaId,
     this.areaId,
     this.userId,
    required this.latitude,
    required this.longitude,
    required this.appToken,
    required this.fcmToken,
    required this.profilePhotoUrl,
  });

  factory DatumShop.fromJson(Map<String, dynamic> json) => DatumShop(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    userType: json["user_type"],
    phone: json["phone"] ?? 'No Data',
    address: json["address"] ?? "No Data",
    emailVerifiedAt: json["email_verified_at"],
    twoFactorConfirmedAt: json["two_factor_confirmed_at"],
    currentTeamId: json["current_team_id"],
    profilePhotoPath: json["profile_photo_path"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    districtId: json["district_id"],
    upozelaId: json["upozela_id"],
    areaId: json["area_id"],
    userId: json["user_id"],
    latitude:json["latitude"] == null?0.00: double.parse(json["latitude"]) ,
    longitude:json["longitude"] == null? 0.00 : double.parse(json["longitude"]),
    appToken: json["app_token"] ?? 'No Data',
    fcmToken: json["fcm_token"],
    profilePhotoUrl: json["profile_photo_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "user_type": userType,
    "phone": phone,
    "address": address,
    "email_verified_at": emailVerifiedAt,
    "two_factor_confirmed_at": twoFactorConfirmedAt,
    "current_team_id": currentTeamId,
    "profile_photo_path": profilePhotoPath,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "district_id": districtId,
    "upozela_id": upozelaId,
    "area_id": areaId,
    "user_id": userId,
    "latitude": latitude,
    "longitude": longitude,
    "app_token": appToken,
    "fcm_token": fcmToken,
    "profile_photo_url": profilePhotoUrl,
  };
}
