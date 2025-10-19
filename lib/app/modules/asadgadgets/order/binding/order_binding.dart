import 'package:asad_gadget/app/modules/asadgadgets/order/controller/order_controller.dart';
import 'package:get/get.dart';

class OrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(
          () => OrderController(),
    );
  }
}

