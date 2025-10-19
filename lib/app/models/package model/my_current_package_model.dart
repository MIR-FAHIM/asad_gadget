// To parse this JSON data, do
//
//     final currentPackageModel = currentPackageModelFromJson(jsonString);

import 'dart:convert';

CurrentPackageModel currentPackageModelFromJson(String str) => CurrentPackageModel.fromJson(json.decode(str));

String currentPackageModelToJson(CurrentPackageModel data) => json.encode(data.toJson());

class CurrentPackageModel {
  String? result;
  DataCurrrent? data;

  CurrentPackageModel({
     this.result,
     this.data,
  });

  factory CurrentPackageModel.fromJson(Map<String, dynamic> json) => CurrentPackageModel(
    result: json["result"],
    data: DataCurrrent.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "data": data!.toJson(),
  };
}

class DataCurrrent {
  String packageName;
  String packageActivationDate;
  String expireDate;

  DataCurrrent({
    required this.packageName,
    required this.packageActivationDate,
    required this.expireDate,
  });

  factory DataCurrrent.fromJson(Map<String, dynamic> json) => DataCurrrent(
    packageName: json["package_name"],
    packageActivationDate: json["package_activation_date"],
    expireDate: json["expire_date"],
  );

  Map<String, dynamic> toJson() => {
    "package_name": packageName,
    "package_activation_date": packageActivationDate,
    "expire_date": expireDate,
  };
}
