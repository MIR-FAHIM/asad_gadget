import 'package:asad_gadget/app/modules/asadgadgets/home/controllers/home_controller.dart';
import 'package:asad_gadget/app/modules/asadgadgets/order/controller/order_controller.dart';
import 'package:asad_gadget/app/modules/asadgadgets/products/controller/product_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
          () => ProductController(),
    );
  }
}

