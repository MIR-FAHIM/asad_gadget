// To parse this JSON data, do
//
//     final agentListModel = agentListModelFromJson(jsonString);

import 'dart:convert';

AgentListModel agentListModelFromJson(String str) => AgentListModel.fromJson(json.decode(str));

String agentListModelToJson(AgentListModel data) => json.encode(data.toJson());

class AgentListModel {
  String? result;
  int? count;
  List<DatumAgent>? data;

  AgentListModel({
     this.result,
     this.count,
     this.data,
  });

  factory AgentListModel.fromJson(Map<String, dynamic> json) => AgentListModel(
    result: json["result"],
    count: json["count"],
    data: List<DatumAgent>.from(json["data"].map((x) => DatumAgent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "count": count,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DatumAgent {
  String? outletName;
  String? mobileNo;
  String? accNo;
  double? balance;
  String? status;
  String? remark;
  int? kyc;
  int? regWithoutPass;

  DatumAgent({
     this.outletName,
     this.mobileNo,
     this.remark,
     this.accNo,
     this.balance,
     this.status,
     this.kyc,
     this.regWithoutPass,
  });

  factory DatumAgent.fromJson(Map<String, dynamic> json) => DatumAgent(
    outletName: json["outlet_name"] ?? "No Data",
    mobileNo: json["mobile_no"] ?? "No Data",
    accNo: json["acc_no"],
    remark: json["remark"] ?? 'Agent',
    balance: json["balance"]?.toDouble(),
    status: json["status"],
    kyc: json["kyc"],
    regWithoutPass: json["registered_without_password"],
  );

  Map<String, dynamic> toJson() => {
    "outlet_name": outletName,
    "mobile_no": mobileNo,
    "remark": remark,
    "acc_no": accNo,
    "balance": balance,
    "status": status,
    "kyc": kyc,
    "registered_without_password": regWithoutPass,
  };
}



