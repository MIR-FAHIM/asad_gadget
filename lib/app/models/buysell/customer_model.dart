// To parse this JSON data, do
//
//     final customerModel = customerModelFromJson(jsonString);

import 'dart:convert';

CustomerModel customerModelFromJson(String str) => CustomerModel.fromJson(json.decode(str));

String customerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  String? message;
  User? user;
  bool? status;
  String? appToken;
  String? sessionToken;
  String? loginTime;

  CustomerModel({
     this.message,
     this.user,
     this.status,
     this.appToken,
     this.sessionToken,
     this.loginTime,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    message: json["message"],
    user: User.fromJson(json["user"]),
    status: json["status"],
    appToken: json["app_token"],
    sessionToken: json["session_token"],
    loginTime: json["login_time"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user!.toJson(),
    "status": status,
    "app_token": appToken,
    "session_token": sessionToken,
    "login_time": loginTime,
  };
}

class User {
  int id;
  String name;
  String email;
  String userType;
  String phone;
  dynamic address;
  dynamic emailVerifiedAt;
  dynamic twoFactorConfirmedAt;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  DateTime createdAt;
  DateTime updatedAt;
  int districtId;
  int upozelaId;
  int areaId;
  int userId;
  String latitude;
  String longitude;
  dynamic appToken;
  String fcmToken;
  String profilePhotoUrl;

  User({
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
    required this.districtId,
    required this.upozelaId,
    required this.areaId,
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.appToken,
    required this.fcmToken,
    required this.profilePhotoUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    userType: json["user_type"],
    phone: json["phone"],
    address: json["address"],
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
    latitude: json["latitude"],
    longitude: json["longitude"],
    appToken: json["app_token"],
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
