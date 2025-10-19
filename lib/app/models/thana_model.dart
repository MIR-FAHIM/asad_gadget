class ThanaModel {
  int? id;
  String? upazilaName;

  ThanaModel({this.id, this.upazilaName});

  ThanaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    upazilaName = json['upazila_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['upazila_name'] = this.upazilaName;
    return data;
  }
}
