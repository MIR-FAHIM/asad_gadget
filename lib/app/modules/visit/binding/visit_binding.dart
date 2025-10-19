
import 'package:asad_gadget/app/modules/asadgadgets/products/controller/product_controller.dart';
import 'package:asad_gadget/app/modules/visit/controller/visit_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class VisitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VisitController>(
          () => VisitController(),
    );
  }
}

