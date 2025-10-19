class HotLineModel {
  String? phone;
  String? email;
  String? link;

  HotLineModel({this.phone, this.email, this.link});

  HotLineModel.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    email = json['email'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['link'] = this.link;
    return data;
  }
}
