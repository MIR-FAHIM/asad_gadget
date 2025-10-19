class DivisionModel {
  int? id;
  String? divisionName;

  DivisionModel({this.id, this.divisionName});

  DivisionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionName = json['division_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['division_name'] = this.divisionName;
    return data;
  }
}
