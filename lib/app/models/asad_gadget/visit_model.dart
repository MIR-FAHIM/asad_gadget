// To parse this JSON data, do
//
//     final getVisitModel = getVisitModelFromJson(jsonString);

import 'dart:convert';

GetVisitModel getVisitModelFromJson(String str) => GetVisitModel.fromJson(json.decode(str));

String getVisitModelToJson(GetVisitModel data) => json.encode(data.toJson());

class GetVisitModel {
  String? status;
  List<DatumVisit>? data;

  GetVisitModel({
     this.status,
     this.data,
  });

  factory GetVisitModel.fromJson(Map<String, dynamic> json) => GetVisitModel(
    status: json["status"],
    data: List<DatumVisit>.from(json["data"].map((x) => DatumVisit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumVisit {
  int id;
  int shopId;
  int assignTo;
  DateTime visitDay;
  String status;
  int assignBy;
  String note;
  bool isActive;
  dynamic visitedTime;
  int? zoneId;
  String serialNo;
  String? latitude;
  String? longitude;
  DateTime createdAt;
  DateTime updatedAt;
  AssignedBy assignedBy;
  AssignedBy shop;

  DatumVisit({
    required this.id,
    required this.shopId,
    required this.assignTo,
    required this.visitDay,
    required this.status,
    required this.assignBy,
    required this.note,
    required this.isActive,
    required this.visitedTime,
    required this.zoneId,
    required this.serialNo,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    required this.assignedBy,
    required this.shop,
  });

  factory DatumVisit.fromJson(Map<String, dynamic> json) => DatumVisit(
    id: json["id"],
    shopId: json["shop_id"],
    assignTo: json["assign_to"],
    visitDay: DateTime.parse(json["visit_day"]),
    status: json["status"],
    assignBy: json["assign_by"],
    note: json["note"],
    isActive: json["is_active"],
    visitedTime: json["visited_time"],
    zoneId: json["zone_id"],
    serialNo: json["serial_no"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    assignedBy: AssignedBy.fromJson(json["assigned_by"]),
    shop: AssignedBy.fromJson(json["shop"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shop_id": shopId,
    "assign_to": assignTo,
    "visit_day": visitDay.toIso8601String(),
    "status": status,
    "assign_by": assignBy,
    "note": note,
    "is_active": isActive,
    "visited_time": visitedTime,
    "zone_id": zoneId,
    "serial_no": serialNo,
    "latitude": latitude,
    "longitude": longitude,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "assigned_by": assignedBy.toJson(),
    "shop": shop.toJson(),
  };
}

class AssignedBy {
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
  dynamic districtId;
  dynamic upozelaId;
  dynamic areaId;
  int userId;
  dynamic latitude;
  dynamic longitude;
  dynamic appToken;
  dynamic fcmToken;
  String profilePhotoUrl;

  AssignedBy({
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

  factory AssignedBy.fromJson(Map<String, dynamic> json) => AssignedBy(
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
