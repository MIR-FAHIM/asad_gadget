class DistrictModel {
  int? id;
  String? districtName;

  DistrictModel({this.id, this.districtName});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    districtName = json['district_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['district_name'] = this.districtName;
    return data;
  }
}
