class NotificationModel {
  String? result;
  List<Data>? data;

  NotificationModel({this.result, this.data});

  NotificationModel.fromJson(Map<String, dynamic> json) {
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
  int? notiId;
  int? activityStatus;


  Data({this.title, this.message, this.image, this.dateTime});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
    image = json['image'] ?? '';
    notiId = json['notification_id'];
    activityStatus = json['activity_status'] ?? 1;
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['message'] = this.message;
    data['image'] = this.image;
    data['notification_id'] = this.notiId;
    data['activity_status'] = this.activityStatus;
    data['date_time'] = this.dateTime;
    return data;
  }
}
