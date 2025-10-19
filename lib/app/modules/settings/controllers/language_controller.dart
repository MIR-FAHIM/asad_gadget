import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../services/settings_service.dart';

class LanguageController extends GetxController {
  GetStorage? _box;
  final locale = ''.obs;

  LanguageController() {
    _box = new GetStorage();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    locale.value = GetStorage().read<String>('language') ?? 'en_US';
    print('locale:${locale.value}');
    super.onInit();
  }

  void updateLocale(value) async {
    if (value.contains('_')) {
      print('updated');
      Get.updateLocale(Locale(value.split('_').elementAt(0), value.split('_').elementAt(1)));
    } else {
      // en
      Get.updateLocale(Locale(value));
    }
    await _box!.write('language', value);
    locale.value = GetStorage().read<String>('language')!;
    print('locale:${locale.value}');
    // if (Get.isDarkMode) {
    //   Get.find<ThemeModeController>().changeThemeMode(ThemeMode.light);
    // }
    Get.rootController.setTheme(Get.find<SettingsService>().getLightTheme());
  }
}
