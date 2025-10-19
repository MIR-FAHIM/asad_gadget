class ExpensesDetailsByHeadModel {
  String? result;
  String? message;
  int? total;
  List<ExpensesDetailsByHead>? data;

  ExpensesDetailsByHeadModel({this.result, this.message, this.total, this.data});

  ExpensesDetailsByHeadModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    total = json['total'];
    if (json['data'] != null) {
      data = <ExpensesDetailsByHead>[];
      json['data'].forEach((v) {
        data!.add(ExpensesDetailsByHead.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    data['total'] = total;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExpensesDetailsByHead {
  int? id;
  int? idExpenseHead;
  var expenseSourceAccNo;
  int? idUser;
  int? amount;
  String? expenseDate;
  String? remark;
  String? image;
  String? type;
  int? idMerchant;
  int? isActive;
  String? createdAt;
  int? createdBy;
  String? updatedAt;
  var updatedBy;
  String? expenseHead;

  ExpensesDetailsByHead(
      {this.id,
      this.idExpenseHead,
      this.expenseSourceAccNo,
      this.idUser,
      this.amount,
      this.expenseDate,
      this.remark,
      this.image,
      this.type,
      this.idMerchant,
      this.isActive,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.expenseHead});

  ExpensesDetailsByHead.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idExpenseHead = json['id_expense_head'];
    expenseSourceAccNo = json['expense_source_acc_no'];
    idUser = json['id_user'];
    amount = json['amount'];
    expenseDate = json['expense_date'];
    remark = json['remark'];
    image = json['image'];
    type = json['type'];
    idMerchant = json['id_merchant'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedAt = json['updated_at'];
    updatedBy = json['updated_by'];
    expenseHead = json['expense_head'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_expense_head'] = idExpenseHead;
    data['expense_source_acc_no'] = expenseSourceAccNo;
    data['id_user'] = idUser;
    data['amount'] = amount;
    data['expense_date'] = expenseDate;
    data['remark'] = remark;
    data['image'] = image;
    data['type'] = type;
    data['id_merchant'] = idMerchant;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['created_by'] = createdBy;
    data['updated_at'] = updatedAt;
    data['updated_by'] = updatedBy;
    data['expense_head'] = expenseHead;
    return data;
  }
}
