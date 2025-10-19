// To parse this JSON data, do
//
//     final getMbankingGatewayModel = getMbankingGatewayModelFromJson(jsonString);

import 'dart:convert';

GetMbankingGatewayModel getMbankingGatewayModelFromJson(String str) => GetMbankingGatewayModel.fromJson(json.decode(str));

String getMbankingGatewayModelToJson(GetMbankingGatewayModel data) => json.encode(data.toJson());

class GetMbankingGatewayModel {
  String result;
  List<DatumCashINOutGateWay> data;

  GetMbankingGatewayModel({
    required this.result,
    required this.data,
  });

  factory GetMbankingGatewayModel.fromJson(Map<String, dynamic> json) => GetMbankingGatewayModel(
    result: json["result"],
    data: List<DatumCashINOutGateWay>.from(json["data"].map((x) => DatumCashINOutGateWay.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DatumCashINOutGateWay {
  int gatewayId;
  String gatewayName;
  String gatewayLogoUrl;

  DatumCashINOutGateWay({
    required this.gatewayId,
    required this.gatewayName,
    required this.gatewayLogoUrl,
  });

  factory DatumCashINOutGateWay.fromJson(Map<String, dynamic> json) => DatumCashINOutGateWay(
    gatewayId: json["gateway_id"],
    gatewayName: json["gateway_name"],
    gatewayLogoUrl: json["gateway_logo_url"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "gateway_id": gatewayId,
    "gateway_name": gatewayName,
    "gateway_logo_url": gatewayLogoUrl,
  };
}
