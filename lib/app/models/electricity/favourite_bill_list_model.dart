class FavouriteListModel {
  List<FavListData>? data;
  String? result;

  FavouriteListModel({this.data, this.result});

  FavouriteListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FavListData>[];
      json['data'].forEach((v) {
        data!.add(new FavListData.fromJson(v));
      });
    }
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['result'] = this.result;
    return data;
  }
}

class FavListData {
  int? saved_bill_id;
  dynamic type_id;
  dynamic biller_id;

  dynamic bill_code;
  dynamic name;
  dynamic image;
  dynamic saved_bill_no;
  dynamic saved_nick_name;

  FavListData(
      {this.saved_bill_id,
      this.type_id,
      this.biller_id,
      this.bill_code,
      this.name,
      this.image,
      this.saved_bill_no,
      this.saved_nick_name});

  FavListData.fromJson(Map<String, dynamic> json) {
    saved_bill_id = json['saved_bill_id'];
    type_id = json['type_id'];
    biller_id = json['biller_id'];
    bill_code = json['bill_code'];

    name = json['name'];
    image = json['image'];
    saved_bill_no = json['saved_bill_no'];
    saved_nick_name = json['saved_nick_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['saved_bill_id'] = this.saved_bill_id;
    data['type_id'] = this.type_id;
    data['biller_id'] = this.biller_id;
    data['bill_code'] = this.bill_code;

    data['name'] = this.name;
    data['image'] = this.image;
    data['saved_bill_no'] = this.saved_bill_no;
    data['saved_nick_name'] = this.saved_nick_name;

    return data;
  }
}
