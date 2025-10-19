class SellModel {
  int? idCustomer;
  double? subtotal;
  String? discType;
  double? discount;
  double? discountAmount;
  double? grandTotal;
  double? netPayable;
  double? due;
  double? paid;
  String? sellingDate;
  String? paidVia;
  String? paymentInfo;
  String? remark;
  List<SellingItems>? sellingItems;

  SellModel(
      {this.idCustomer,
      this.subtotal,
      this.discType,
      this.discount,
      this.discountAmount,
      this.grandTotal,
      this.netPayable,
      this.due,
      this.paid,
      this.sellingDate,
      this.paidVia,
      this.paymentInfo,
      this.remark,
      this.sellingItems});

  SellModel.fromJson(Map<String, dynamic> json) {
    idCustomer = json['id_customer'];
    subtotal = json['subtotal'];
    discType = json['disc_type'];
    discount = json['discount'];
    discountAmount = json['discount_amount'];
    grandTotal = json['grand_total'];
    netPayable = json['net_payable'];
    due = json['due'];
    paid = json['paid'];
    sellingDate = json['selling_date'];
    paidVia = json['paid_via'];
    paymentInfo = json['payment_info'];
    remark = json['remark'];
    if (json['items'] != null) {
      sellingItems = <SellingItems>[];
      json['items'].forEach((v) {
        sellingItems!.add(SellingItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_customer'] = idCustomer;
    data['subtotal'] = subtotal;
    data['disc_type'] = discType;
    data['discount'] = discount;
    data['discount_amount'] = discountAmount;
    data['grand_total'] = grandTotal;
    data['net_payable'] = netPayable;
    data['due'] = due;
    data['paid'] = paid;
    data['selling_date'] = sellingDate;
    data['paid_via'] = paidVia;
    data['payment_info'] = paymentInfo;
    data['remark'] = remark;
    if (sellingItems != null) {
      data['items'] = sellingItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SellingItems {
  int? idItem;
  double? buyingRate;
  double? rate;
  double? discountPercent;
  double? rateWithDisc;
  double? quantity;
  double? total;

  SellingItems(
      {this.idItem,
      this.buyingRate,
      this.rate,
      this.discountPercent,
      this.rateWithDisc,
      this.quantity,
      this.total});

  SellingItems.fromJson(Map<String, dynamic> json) {
    idItem = json['id_item'];
    buyingRate = json['buying_rate'];
    rate = json['rate'];
    discountPercent = json['discount_percent'];
    rateWithDisc = json['rate_with_disc'];
    quantity = json['quantity'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_item'] = idItem;
    data['buying_rate'] = buyingRate;
    data['rate'] = rate;
    data['discount_percent'] = discountPercent;
    data['rate_with_disc'] = rateWithDisc;
    data['quantity'] = quantity;
    data['total'] = total;
    return data;
  }
}
