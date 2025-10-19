import 'dart:typed_data';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:asad_gadget/common/custom_data.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<Uint8List> makePdf(
  dynamic _title,
  dynamic _images,
  dynamic _bllr_accno,
  dynamic _bll_no,
  dynamic _bll_mobno,
  dynamic _bll_dt_frm,
  dynamic _bll_dt_to,
  dynamic _bll_dt_due,
  dynamic charge,
  dynamic transaction_id,
  dynamic bll_amnt_ttl,
  dynamic payment_date,
  dynamic billToken,
) async {
  final pdf = Document();
  final imageLogo = MemoryImage(
      (await rootBundle.load('assets/Logo.png')).buffer.asUint8List());
  pdf.addPage(Page(
    pageFormat: PdfPageFormat.a5,
    build: (context) => Center(
      // child:
      // Text(text, style: TextStyle(fontSize: 48)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: SizedBox(
                height: 40,
                width: 100,
                child: Image(imageLogo),
              )),
          Container(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(_title,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                )),
          ),
          Center(
            child: Text(
              "Payment Successful",
              style: TextStyle(
                  fontSize: 20,
                  color: PdfColors.green,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bill Information : ",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    _bll_no == null || _bll_no == ""
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Bill No.",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: PdfColors.deepPurple,
                                  ),
                                ),
                                Text(
                                  _bll_no,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    _bllr_accno == null || _bllr_accno == ""
                        ? Container()
                        : Column(
                            children: [
                              Container(
                                width: size.width,
                                height: 1,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Biller Acc No.",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: PdfColors.deepPurple,
                                      ),
                                    ),
                                    Text(
                                      _bllr_accno == null ? "" : _bllr_accno,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                    _bll_mobno == null || _bll_mobno == ""
                        ? Container()
                        : Column(
                            children: [
                              Container(
                                width: size.width,
                                height: 1,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Biller Mobile No.",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: PdfColors.deepPurple,
                                      ),
                                    ),
                                    Text(
                                      _bll_mobno == null ? "" : _bll_mobno,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                    _bll_dt_frm == null ||
                            _bll_dt_frm == "" ||
                            _bll_dt_to == null ||
                            _bll_dt_to == ''
                        ? Container()
                        : Column(
                            children: [
                              Container(
                                width: size.width,
                                height: 1,
                                color: PdfColors.deepPurple,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Biller For",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: PdfColors.deepPurple,
                                      ),
                                    ),
                                    Text(
                                      _bll_dt_frm + " to " + _bll_dt_to,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: PdfColors.deepPurple,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                    _bll_dt_due == null || _bll_dt_due == ""
                        ? Container()
                        : Column(
                            children: [
                              Container(
                                width: size.width,
                                height: 1,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 8, bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Bill Due Date",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: PdfColors.deepPurple,
                                      ),
                                    ),
                                    Text(
                                      _bll_dt_due,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                    SizedBox(
                      width: size.width,
                      height: 30,
                      // color: AppColors.SectionHighLightCardBg,
                    ),
                    Text(
                      "Transaction Information :",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    transaction_id == null || transaction_id == ""
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Transaction Id",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: PdfColors.deepPurple,
                                  ),
                                ),
                                Text(
                                  transaction_id,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    payment_date == null || payment_date == ""
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Payment Date",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: PdfColors.deepPurple,
                                  ),
                                ),
                                Text(
                                  payment_date == null ? "" : payment_date,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    billToken == null || billToken == "No Token"
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Bill Token",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: PdfColors.deepPurple,
                                  ),
                                ),
                                Text(
                                  billToken ?? "",
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    charge == null || charge == ""
                        ? Container()
                        : Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Charge",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: PdfColors.deepPurple,
                                  ),
                                ),
                                Text(
                                  charge,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total Amount ",
                            style: const TextStyle(
                              fontSize: 14,
                              color: PdfColors.deepPurple,
                            ),
                          ),
                          Text(
                            bll_amnt_ttl,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Powered by PayStation.",
              style: TextStyle(
                  fontSize: 11,
                  color: PdfColors.black,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    ),
  ));
  return pdf.save();
}

Widget PaddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: align,
      ),
    );
