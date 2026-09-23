import 'dart:async';
import 'package:get/get.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/app/services/auth_service.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), () {
      if (Get.isRegistered<AuthService>() && Get.find<AuthService>().isAuth) {
        Get.offAllNamed(Routes.ROOT);
      } else {
        Get.offAllNamed(Routes.LOGIN);
      }
    });
  }
}
