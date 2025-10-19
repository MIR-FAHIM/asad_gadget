// To parse this JSON data, do
//
//     final getProfileInfo = getProfileInfoFromJson(jsonString);

import 'dart:convert';

GetProfileInfo getProfileInfoFromJson(String str) => GetProfileInfo.fromJson(json.decode(str));

String getProfileInfoToJson(GetProfileInfo data) => json.encode(data.toJson());

class GetProfileInfo {
  String? result;
  String? profileImageUrl;
  Data? data;

  GetProfileInfo({
     this.result,
     this.profileImageUrl,
     this.data,
  });

  factory GetProfileInfo.fromJson(Map<String, dynamic> json) => GetProfileInfo(
    result: json["result"],
    profileImageUrl: json["profile_image_url"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "profile_image_url": profileImageUrl,
    "data": data!.toJson(),
  };
}

class Data {
  String accNo;
  String mobileNo;
  double balance;
  String stockBalance;
  String dealerId;
  String customerName;
  String outletName;
  String outletAddress;
  String personalMobile;
  dynamic email;
  dynamic districtName;
  dynamic father;
  dynamic mother;
  dynamic gender;
  dynamic spouse;
  dynamic premanentAddress;
  dynamic presentAddress;
  int packageId;
  DateTime packageStartDate;
  String packageEndDate;
  dynamic image;

  Data({
    required this.accNo,
    required this.mobileNo,
    required this.balance,
    required this.stockBalance,
    required this.dealerId,
    required this.customerName,
    required this.outletName,
    required this.outletAddress,
    required this.personalMobile,
    required this.email,
    required this.districtName,
    required this.father,
    required this.mother,
    required this.gender,
    required this.spouse,
    required this.premanentAddress,
    required this.presentAddress,
    required this.packageId,
    required this.packageStartDate,
    required this.packageEndDate,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accNo: json["acc_no"],
    mobileNo: json["mobile_no"],
    balance: json["balance"]?.toDouble(),
    stockBalance: json["stock_balance"],
    dealerId: json["dealer_id"],
    customerName: json["customer_name"],
    outletName: json["outlet_name"],
    outletAddress: json["outlet_address"],
    personalMobile: json["personal_mobile"],
    email: json["email"],
    districtName: json["district_name"],
    father: json["father"],
    mother: json["mother"],
    gender: json["gender"],
    spouse: json["spouse"],
    premanentAddress: json["premanent_address"],
    presentAddress: json["present_address"],
    packageId: json["package_id"],
    packageStartDate: DateTime.parse(json["package_start_date"]),
    packageEndDate: json["package_end_date"] ?? DateTime.now().toString(),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "acc_no": accNo,
    "mobile_no": mobileNo,
    "balance": balance,
    "stock_balance": stockBalance,
    "dealer_id": dealerId,
    "customer_name": customerName,
    "outlet_name": outletName,
    "outlet_address": outletAddress,
    "personal_mobile": personalMobile,
    "email": email,
    "district_name": districtName,
    "father": father,
    "mother": mother,
    "gender": gender,
    "spouse": spouse,
    "premanent_address": premanentAddress,
    "present_address": presentAddress,
    "package_id": packageId,
    "package_start_date": "${packageStartDate.year.toString().padLeft(4, '0')}-${packageStartDate.month.toString().padLeft(2, '0')}-${packageStartDate.day.toString().padLeft(2, '0')}",
    "package_end_date": packageEndDate,
    "image": image,
  };
}
