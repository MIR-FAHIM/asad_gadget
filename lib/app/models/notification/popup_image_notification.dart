// To parse this JSON data, do
//
//     final popUpImageNotificarionModel = popUpImageNotificarionModelFromJson(jsonString);

import 'dart:convert';

PopUpImageNotificarionModel popUpImageNotificarionModelFromJson(String str) => PopUpImageNotificarionModel.fromJson(json.decode(str));

String popUpImageNotificarionModelToJson(PopUpImageNotificarionModel data) => json.encode(data.toJson());

class PopUpImageNotificarionModel {
  bool? result;
  List<NotiDatum>? data;
  String? message;

  PopUpImageNotificarionModel({
     this.result,
     this.data,
     this.message,
  });

  factory PopUpImageNotificarionModel.fromJson(Map<String, dynamic> json) => PopUpImageNotificarionModel(
    result: json["result"],
    data: List<NotiDatum>.from(json["data"].map((x) => NotiDatum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "result": result,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class NotiDatum {
  int? id;
  int? catId;
  int? subCatId;
  String? notifFor;
  String? notifTo;
  String? title;
  String? message;
  String? image;
  String? times;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? createdAt;

  NotiDatum({
     this.id,
     this.catId,
     this.subCatId,
     this.notifFor,
     this.notifTo,
     this.title,
     this.message,
     this.image,
     this.times,
     this.startDate,
     this.endDate,
     this.createdAt,
  });

  factory NotiDatum.fromJson(Map<String, dynamic> json) => NotiDatum(
    id: json["id"],
    catId: json["cat_id"],
    subCatId: json["sub_cat_id"],
    notifFor: json["notif_for"],
    notifTo: json["notif_to"],
    title: json["title"],
    message: json["message"],
    image: json["image"] ?? "https://scontent.fdac22-1.fna.fbcdn.net/v/t39.30808-6/419824910_341876885405156_8621633566582861745_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=3635dc&_nc_ohc=6RjgrOe9f14AX-OWToo&_nc_ht=scontent.fdac22-1.fna&oh=00_AfAdIIova0JeDYTRxCtFpkg_cnEtNVOeH14SQV_z65iaZw&oe=65AC06F7",
    times: json["times"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cat_id": catId,
    "sub_cat_id": subCatId,
    "notif_for": notifFor,
    "notif_to": notifTo,
    "title": title,
    "message": message,
    "image": image,
    "times": times,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "created_at": createdAt!.toIso8601String(),
  };
}
