class UnionModel {
  int? id;
  String? unionName;

  UnionModel({this.id, this.unionName});

  UnionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    unionName = json['union_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['union_name'] = this.unionName;
    return data;
  }
}
