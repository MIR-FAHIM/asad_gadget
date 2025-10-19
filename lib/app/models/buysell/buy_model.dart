class BuyModel {
  int? idVendor;
  String? invoiceNo;
  double? subtotal;
  String? discType;
  double? discount;
  double? discountAmount;
  double? grandTotal;
  double? netPayable;
  double? due;
  double? paid;
  String? purchaseDate;
  String? paidVia;
  String? paymentInfo;
  String? remark;
  List<BuyingItems>? buyingitems;

  BuyModel(
      {this.idVendor,
      this.invoiceNo,
      this.subtotal,
      this.discType,
      this.discount,
      this.discountAmount,
      this.grandTotal,
      this.netPayable,
      this.due,
      this.paid,
      this.purchaseDate,
      this.paidVia,
      this.paymentInfo,
      this.remark,
      this.buyingitems});

  BuyModel.fromJson(Map<String, dynamic> json) {
    idVendor = json['id_vendor'];
    invoiceNo = json['invoice_no'];
    subtotal = json['subtotal'];
    discType = json['disc_type'];
    discount = json['discount'];
    discountAmount = json['discount_amount'];
    grandTotal = json['grand_total'];
    netPayable = json['net_payable'];
    due = json['due'];
    paid = json['paid'];
    purchaseDate = json['purchase_date'];
    paidVia = json['paid_via'];
    paymentInfo = json['payment_info'];
    remark = json['remark'];
    if (json['items'] != null) {
      buyingitems = <BuyingItems>[];
      json['items'].forEach((v) {
        buyingitems!.add(BuyingItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_vendor'] = idVendor;
    data['invoice_no'] = invoiceNo;
    data['subtotal'] = subtotal;
    data['disc_type'] = discType;
    data['discount'] = discount;
    data['discount_amount'] = discountAmount;
    data['grand_total'] = grandTotal;
    data['net_payable'] = netPayable;
    data['due'] = due;
    data['paid'] = paid;
    data['purchase_date'] = purchaseDate;
    data['paid_via'] = paidVia;
    data['payment_info'] = paymentInfo;
    data['remark'] = remark;
    if (buyingitems != null) {
      data['items'] = buyingitems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BuyingItems {
  int? idItem;
  double? rateWithoutDisc;
  double? discountPercent;
  double? rate;
  int? quantity;
  double? total;
  double? totalWithoutDisc;

  BuyingItems(
      {this.idItem,
      this.rateWithoutDisc,
      this.discountPercent,
      this.rate,
      this.quantity,
      this.total,
      this.totalWithoutDisc});

  BuyingItems.fromJson(Map<String, dynamic> json) {
    idItem = json['id_item'];
    rateWithoutDisc = json['rate_without_disc'];
    discountPercent = json['discount_percent'];
    rate = json['rate'];
    quantity = json['quantity'];
    total = json['total'];
    totalWithoutDisc = json['total_without_disc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_item'] = idItem;
    data['rate_without_disc'] = rateWithoutDisc;
    data['discount_percent'] = discountPercent;
    data['rate'] = rate;
    data['quantity'] = quantity;
    data['total'] = total;
    data['total_without_disc'] = totalWithoutDisc;
    return data;
  }
}
