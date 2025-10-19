// To parse this JSON data, do
//
//     final getShopByDsr = getShopByDsrFromJson(jsonString);

import 'dart:convert';

GetShopByDsr getShopByDsrFromJson(String str) => GetShopByDsr.fromJson(json.decode(str));

String getShopByDsrToJson(GetShopByDsr data) => json.encode(data.toJson());

class GetShopByDsr {
  String? status;
  List<DatumShopDSR>? data;

  GetShopByDsr({
     this.status,
     this.data,
  });

  factory GetShopByDsr.fromJson(Map<String, dynamic> json) => GetShopByDsr(
    status: json["status"],
    data: List<DatumShopDSR>.from(json["data"].map((x) => DatumShopDSR.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumShopDSR {
  int id;
  String name;
  String email;
  String userType;
  String phone;
  String? address;
  dynamic emailVerifiedAt;
  String password;
  dynamic twoFactorSecret;
  dynamic twoFactorRecoveryCodes;
  dynamic twoFactorConfirmedAt;
  dynamic rememberToken;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  DateTime createdAt;
  int createdBy;
  DateTime updatedAt;
  int districtId;
  int upozelaId;
  int areaId;
  int userId;
  String latitude;
  String longitude;
  String? appToken;
  String fcmToken;

  DatumShopDSR({
    required this.id,
    required this.name,
    required this.email,
    required this.userType,
    required this.phone,
     this.address,
    required this.emailVerifiedAt,
    required this.password,
    required this.twoFactorSecret,
    required this.twoFactorRecoveryCodes,
    required this.twoFactorConfirmedAt,
    required this.rememberToken,
    required this.currentTeamId,
    required this.profilePhotoPath,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.districtId,
    required this.upozelaId,
    required this.areaId,
    required this.userId,
    required this.latitude,
    required this.longitude,
     this.appToken,
    required this.fcmToken,
  });

  factory DatumShopDSR.fromJson(Map<String, dynamic> json) => DatumShopDSR(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    userType: json["user_type"],
    phone: json["phone"],
    address: json["address"] ?? "No Address",
    emailVerifiedAt: json["email_verified_at"],
    password: json["password"],
    twoFactorSecret: json["two_factor_secret"],
    twoFactorRecoveryCodes: json["two_factor_recovery_codes"],
    twoFactorConfirmedAt: json["two_factor_confirmed_at"],
    rememberToken: json["remember_token"],
    currentTeamId: json["current_team_id"],
    profilePhotoPath: json["profile_photo_path"],
    createdAt: DateTime.parse(json["created_at"]),
    createdBy: json["created_by"],
    updatedAt: DateTime.parse(json["updated_at"]),
    districtId: json["district_id"],
    upozelaId: json["upozela_id"],
    areaId: json["area_id"],
    userId: json["user_id"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    appToken: json["app_token"] ?? "No Data",
    fcmToken: json["fcm_token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "user_type": userType,
    "phone": phone,
    "address": address,
    "email_verified_at": emailVerifiedAt,
    "password": password,
    "two_factor_secret": twoFactorSecret,
    "two_factor_recovery_codes": twoFactorRecoveryCodes,
    "two_factor_confirmed_at": twoFactorConfirmedAt,
    "remember_token": rememberToken,
    "current_team_id": currentTeamId,
    "profile_photo_path": profilePhotoPath,
    "created_at": createdAt.toIso8601String(),
    "created_by": createdBy,
    "updated_at": updatedAt.toIso8601String(),
    "district_id": districtId,
    "upozela_id": upozelaId,
    "area_id": areaId,
    "user_id": userId,
    "latitude": latitude,
    "longitude": longitude,
    "app_token": appToken,
    "fcm_token": fcmToken,
  };
}
