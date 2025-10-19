import 'package:get/get.dart';
import 'package:asad_gadget/app/modules/settings/controllers/language_controller.dart';

import '../controllers/settings_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(
      () => SettingsController(),
    );

    Get.lazyPut<LanguageController>(
      () => LanguageController(),
    );
  }
}
