import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';

class ProductDetailModel {
  String? title;
  String? value;

  VoidCallback? press;

  ProductDetailModel({this.title, this.value, this.press});
}

List<ProductDetailModel> productDetail = [
  ProductDetailModel(title: 'স্টক মূল্য', value: '৳ ', press: () {}),
  ProductDetailModel(title: 'ক্রয় মূল্য', value: '৳ ', press: () {}),
  ProductDetailModel(title: 'বিক্রয় মূল্য', value: '৳ ', press: () {}),
  ProductDetailModel(title: 'স্টক সংখ্যা', value: '', press: () {}),
  ProductDetailModel(title: 'ডিসকাউন্ট', value: ' %', press: () {}),
  ProductDetailModel(title: 'ভ্যাট', value: '%', press: () {}),
  ProductDetailModel(title: 'পণ্যের পরিমাণ', value: '', press: () {}),
];
