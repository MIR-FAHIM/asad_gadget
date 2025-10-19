class AddProductModel {
  String? name;
  String? quantity;
  String? stockAlert;
  String? buyingPrice;
  String? sellingPrice;
  String? discountPercent;
  String? vatPercent;
  String? expireDate;
  String? barcode;
  String? details;
  String? idCat;
  String? idSubcat;
  String? idUnit;
  String? size;
  String? color;

  AddProductModel(
      {this.name,
      this.quantity,
      this.stockAlert,
      this.buyingPrice,
      this.sellingPrice,
      this.discountPercent,
      this.vatPercent,
      this.expireDate,
      this.barcode,
      this.details,
      this.idCat,
      this.idSubcat,
      this.idUnit,
      this.size,
      this.color});

  AddProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    stockAlert = json['stock_alert'];
    buyingPrice = json['buying_price'];
    sellingPrice = json['selling_price'];
    discountPercent = json['discount_percent'];
    vatPercent = json['vat_percent'];
    expireDate = json['expire_date'];
    barcode = json['barcode'];
    details = json['details'];
    idCat = json['id_cat'];
    idSubcat = json['id_subcat'];
    idUnit = json['id_unit'];
    size = json['size'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name ?? '';
    data['quantity'] = quantity ?? "";
    data['stock_alert'] = stockAlert ?? '';
    data['buying_price'] = buyingPrice ?? '';
    data['selling_price'] = sellingPrice ?? '';
    data['discount_percent'] = discountPercent ?? '0';
    data['vat_percent'] = vatPercent ?? '';
    data['expire_date'] = expireDate ?? '';
    data['barcode'] = barcode ?? '';
    data['details'] = details ?? '';
    data['id_cat'] = idCat ?? '';
    data['id_subcat'] = idSubcat ?? '';
    data['id_unit'] = idUnit ?? '';
    data['size'] = size ?? '';
    data['color'] = color ?? '';
    return data;
  }
}
