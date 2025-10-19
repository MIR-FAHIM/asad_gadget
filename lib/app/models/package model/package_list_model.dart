// To parse this JSON data, do
//
//     final packageList = packageListFromJson(jsonString);

import 'dart:convert';

PackageListModel packageListFromJson(String str) => PackageListModel.fromJson(json.decode(str));

String packageListToJson(PackageListModel data) => json.encode(data.toJson());

class PackageListModel {
  String? result;
  List<DatumPackage>? data;

  PackageListModel({
     this.result,
     this.data,
  });

  factory PackageListModel.fromJson(Map<String, dynamic> json) => PackageListModel(
    result: json["result"],
    data: List<DatumPackage>.from(json["data"].map((x) => DatumPackage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumPackage {
  int packageId;
  String packageName;
  String packageNameBn;
  String price;
  bool currentPackage;
  List<ServiceList> serviceList;

  DatumPackage({
    required this.packageId,
    required this.packageName,
    required this.packageNameBn,
    required this.currentPackage,
    required this.serviceList,
    required this.price,
  });

  factory DatumPackage.fromJson(Map<String, dynamic> json) => DatumPackage(
    packageId: json["package_id"],
    packageName: json["package_name"],
    packageNameBn: json["package_name_bn"],
    price: json["price"].toString(),
    currentPackage: json["current_package"],
    serviceList: List<ServiceList>.from(json["service_list"].map((x) => ServiceList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "package_id": packageId,
    "package_name": packageName,
    "price": price,
    "package_name_bn": packageNameBn,
    "current_package": currentPackage,
    "service_list": List<dynamic>.from(serviceList.map((x) => x.toJson())),
  };
}

class ServiceList {
  String name;
  String nameBn;

  ServiceList({
    required this.name,
    required this.nameBn,
  });

  factory ServiceList.fromJson(Map<String, dynamic> json) => ServiceList(
    name: json["name"],
    nameBn: json["name_bn"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "name_bn": nameBn,
  };
}
