import 'package:get/get.dart';

import '../controllers/current_due_controller.dart';

class CurrentDueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CurrentDueController>(
      () => CurrentDueController(),
    );
  }
}
