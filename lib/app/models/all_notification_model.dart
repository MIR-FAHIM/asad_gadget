class AllNotificationModel {
  String? result;
  List<Data>? data;

  AllNotificationModel({this.result, this.data});

  AllNotificationModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? title;
  String? message;
  String? image;
  String? dateTime;

  Data({this.title, this.message, this.image, this.dateTime});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    image = json['image'] ?? '';
    dateTime = json['notification_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['message'] = this.message;
    data['image'] = this.image;
    data['notification_time'] = this.dateTime;
    return data;
  }
}
