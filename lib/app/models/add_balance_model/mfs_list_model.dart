class MFSListModel {
  int? id;
  String? code;
  String? name;
  String? logo;
  String? charge;
  String? type;

  MFSListModel({
    this.id,
    this.code,
    this.name,
    this.logo,
    this.charge,
    this.type,
  });

  MFSListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    logo = json['logo'];
    charge = json['charge'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['charge'] = this.charge;
    data['type'] = this.type;
    return data;
  }
}



