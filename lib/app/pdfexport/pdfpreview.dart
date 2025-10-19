import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'pdf/pdfexport.dart';

class PdfPreviewPage extends StatelessWidget {
  var title;
  dynamic images;
  dynamic bllr_accno;
  dynamic bll_no;
  dynamic bll_mobno;
  dynamic bll_dt_frm;
  dynamic bll_dt_to;
  dynamic bll_dt_due;
  dynamic charge;
  dynamic token;
  dynamic transaction_id;
  dynamic bll_amnt_ttl;
  dynamic payment_date;
  PdfPreviewPage({
    Key? key,
    this.title,
    this.images,
    this.bllr_accno,
    this.bll_no,
    this.token,
    this.bll_mobno,
    this.bll_dt_frm,
    this.bll_dt_to,
    this.bll_dt_due,
    this.charge,
    this.transaction_id,
    this.bll_amnt_ttl,
    this.payment_date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF652981),
        centerTitle: true,
        title: Text(title),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: PdfPreview(
        useActions: true,
        allowSharing: true,
        canChangeOrientation: false,
        canChangePageFormat: false,
        canDebug: false,
        build: (context) => makePdf(
            title,
            images,
            bllr_accno,
            bll_no,
            bll_mobno,
            bll_dt_frm,
            bll_dt_to,
            bll_dt_due,
            charge,
            transaction_id,
            bll_amnt_ttl,
            payment_date,
            token),
      ),
    );
  }
}
