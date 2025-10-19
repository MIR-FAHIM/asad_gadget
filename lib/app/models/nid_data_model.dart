class NIDDataModel {
  String? transactionId;
  int? creditCost;
  int? creditCurrent;
  String? status;
  Data? data;

  NIDDataModel({this.transactionId, this.creditCost, this.creditCurrent, this.status, this.data});

  NIDDataModel.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    creditCost = json['creditCost'];
    creditCurrent = json['creditCurrent'];
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['transactionId'] = this.transactionId;
    data['creditCost'] = this.creditCost;
    data['creditCurrent'] = this.creditCurrent;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }

    return data;
  }
}

class Data {
  Nid? nid;

  Data({this.nid});

  Data.fromJson(Map<String, dynamic> json) {
    nid = json['nid'] != null ? new Nid.fromJson(json['nid']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nid != null) {
      data['nid'] = this.nid!.toJson();
    }
    return data;
  }
}

class Nid {
  String? fullNameEN;
  String? fathersNameEN;
  String? mothersNameEN;
  String? presentAddressEN;
  String? permenantAddressEN;
  String? fullNameBN;
  String? fathersNameBN;
  String? mothersNameBN;
  String? spouseNameBN;
  String? presentAddressBN;
  String? permanentAddressBN;
  String? gender;
  String? profession;
  String? dateOfBirth;
  String? nationalIdNumber;
  String? oldNationalIdNumber;
  String? photoUrl;

  Nid(
      {this.fullNameEN,
      this.fathersNameEN,
      this.mothersNameEN,
      this.presentAddressEN,
      this.permenantAddressEN,
      this.fullNameBN,
      this.fathersNameBN,
      this.mothersNameBN,
      this.spouseNameBN,
      this.presentAddressBN,
      this.permanentAddressBN,
      this.gender,
      this.profession,
      this.dateOfBirth,
      this.nationalIdNumber,
      this.oldNationalIdNumber,
      this.photoUrl});

  Nid.fromJson(Map<String, dynamic> json) {
    fullNameEN = json['fullNameEN'];
    fathersNameEN = json['fathersNameEN'];
    mothersNameEN = json['mothersNameEN'];
    presentAddressEN = json['presentAddressEN'];
    permenantAddressEN = json['permenantAddressEN'];
    fullNameBN = json['fullNameBN'];
    fathersNameBN = json['fathersNameBN'];
    mothersNameBN = json['mothersNameBN'];
    spouseNameBN = json['spouseNameBN'];
    presentAddressBN = json['presentAddressBN'];
    permanentAddressBN = json['permanentAddressBN'];
    gender = json['gender'];
    profession = json['profession'];
    dateOfBirth = json['dateOfBirth'];
    nationalIdNumber = json['nationalIdNumber'];
    oldNationalIdNumber = json['oldNationalIdNumber'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullNameEN'] = this.fullNameEN;
    data['fathersNameEN'] = this.fathersNameEN;
    data['mothersNameEN'] = this.mothersNameEN;
    data['presentAddressEN'] = this.presentAddressEN;
    data['permenantAddressEN'] = this.permenantAddressEN;
    data['fullNameBN'] = this.fullNameBN;
    data['fathersNameBN'] = this.fathersNameBN;
    data['mothersNameBN'] = this.mothersNameBN;
    data['spouseNameBN'] = this.spouseNameBN;
    data['presentAddressBN'] = this.presentAddressBN;
    data['permanentAddressBN'] = this.permanentAddressBN;
    data['gender'] = this.gender;
    data['profession'] = this.profession;
    data['dateOfBirth'] = this.dateOfBirth;
    data['nationalIdNumber'] = this.nationalIdNumber;
    data['oldNationalIdNumber'] = this.oldNationalIdNumber;
    data['photoUrl'] = this.photoUrl;
    return data;
  }
}
