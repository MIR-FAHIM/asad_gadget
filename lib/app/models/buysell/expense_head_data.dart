class ExpenseHeadModel {
  String? result;
  List<ExpenseHeaddata>? data;
  String? message;

  ExpenseHeadModel({this.result, this.data, this.message});

  ExpenseHeadModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    if (json['data'] != null) {
      data = <ExpenseHeaddata>[];
      json['data'].forEach((v) {
        data!.add(ExpenseHeaddata.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ExpenseHeaddata {
  int? id;
  String? expenseHead;
  String? remark;
  int? idMerchant;
  int? isActive;
  String? createdAt;
  int? createdBy;
  String? updatedAt;
  String? updatedBy;

  ExpenseHeaddata(
      {this.id,
      this.expenseHead,
      this.remark,
      this.idMerchant,
      this.isActive,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy});

  ExpenseHeaddata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expenseHead = json['expense_head'];
    remark = json['remark'];
    idMerchant = json['id_merchant'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['expense_head'] = expenseHead;
    data['remark'] = remark;
    data['id_merchant'] = idMerchant;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    data['updated_at'] = updatedAt;
    data['updated_by'] = updatedBy;
    return data;
  }
}
