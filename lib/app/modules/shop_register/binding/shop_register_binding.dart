import 'package:asad_gadget/app/modules/asadgadgets/home/controllers/home_controller.dart';
import 'package:asad_gadget/app/modules/shop_register/controller/shop_register_controller.dart';
import 'package:get/get.dart';


class ShopRegisterBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ShopRegisterController>(
          () => ShopRegisterController(),
    );



  }
}
