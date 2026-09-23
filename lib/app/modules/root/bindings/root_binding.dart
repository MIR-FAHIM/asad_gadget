import 'package:get/get.dart';
import '../controllers/root_controller.dart';
import '../repositories/root_repository.dart';

class RootBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RootRepository>(() => RootRepository());
    Get.lazyPut<RootController>(() => RootController());
  }
}
