class OperatorModel {
  int? id;
  String? name;
  String? shortName;
  String? operatorCode;
  String? createdAt;
  int? createdBy;
  String? updatedAt;
  String? updatedBy;
  String? activationStatus;
  String? optCommission;
  String? logo;

  OperatorModel({this.id, this.name, this.shortName, this.operatorCode, this.createdAt, this.createdBy, this.updatedAt, this.updatedBy, this.activationStatus, this.optCommission, this.logo});

  OperatorModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['short_name'];
    operatorCode = json['operator_code'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    activationStatus = json['activation_status'];
    optCommission = json['opt_commission'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['short_name'] = this.shortName;
    data['operator_code'] = this.operatorCode;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_at'] = this.updatedAt;
    data['updated_by'] = this.updatedBy;
    data['activation_status'] = this.activationStatus;
    data['opt_commission'] = this.optCommission;
    data['logo'] = this.logo;
    return data;
  }
}

List<OperatorModel> operators = [
  OperatorModel(name: '017', logo: "assets/sim/gp.png", id: 1),
  OperatorModel(name: '013', logo: "assets/sim/gp.png", id: 1),
  OperatorModel(name: '018', logo: "assets/sim/robi.png", id: 4),
  OperatorModel(name: '014', logo: "assets/sim/bl.png", id: 2),
  OperatorModel(name: '019', logo: "assets/sim/bl.png", id: 2),
  OperatorModel(name: '016', logo: "assets/sim/art.png", id: 3),
  OperatorModel(name: '015', logo: "assets/sim/teletalk.png", id: 5),
];

List<OperatorModel> operatorLogos = [
  OperatorModel(name: '017', logo: "assets/sim/gp.png", id: 1),
  OperatorModel(name: '018', logo: "assets/sim/robi.png", id: 4),
  OperatorModel(name: '014', logo: "assets/sim/bl.png", id: 2),
  OperatorModel(name: '016', logo: "assets/sim/art.png", id: 3),
  OperatorModel(name: '015', logo: "assets/sim/teletalk.png", id: 5),
];
