class ExpensesHistoryModel {
  String? result;
  String? message;
  int? allTotal;
  List<ExpensesHistory>? expensesdata;

  ExpensesHistoryModel({this.result, this.message, this.allTotal, this.expensesdata});

  ExpensesHistoryModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    allTotal = json['allTotal'];
    if (json['data'] != null) {
      expensesdata = <ExpensesHistory>[];
      json['data'].forEach((v) {
        expensesdata!.add(ExpensesHistory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    data['allTotal'] = allTotal;
    if (expensesdata != null) {
      data['data'] = expensesdata!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExpensesHistory {
  int? idExpenseHead;
  String? expenseHead;
  int? total;

  ExpensesHistory({this.idExpenseHead, this.expenseHead, this.total});

  ExpensesHistory.fromJson(Map<String, dynamic> json) {
    idExpenseHead = json['id_expense_head'];
    expenseHead = json['expense_head'];
    total = json['total'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_expense_head'] = idExpenseHead;
    data['expense_head'] = expenseHead;
    data['total'] = total;
    return data;
  }
}
