import 'package:asad_gadget/app/modules/asadgadgets/home/controllers/home_controller.dart';
import 'package:get/get.dart';


import '../controllers/root_controller.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<RootController>(
      () => RootController(),
    );


    Get.lazyPut<HomeController>(
      () => HomeController(),
    );


  }
}
