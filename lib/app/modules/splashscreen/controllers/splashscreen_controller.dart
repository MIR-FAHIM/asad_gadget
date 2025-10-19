import 'dart:async';

import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:asad_gadget/app/models/notification/popup_image_notification.dart';

import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/app/services/auth_service.dart';
import 'package:asad_gadget/main.dart';
import 'package:asad_gadget/service/shared_pref.dart';



class SplashscreenController extends GetxController {
  //TODO: Implement SplashscreenController

  final count = 0.obs;
  final imageUrlPop = "".obs;
  final imageNotificationPopList = <NotiDatum>[].obs;
  @override
  Future<void> onInit() async {
    if(SharedPreff.to.prefss.getString("popDate") == null){
      print("find null in pop up notification time sharedpref");
      SharedPreff.to.prefss.setString("popDate", DateTime.now().toString());
    }

    Timer(const Duration(seconds: 3), () {

      //Get.find<PackageController>().currentPackageModel.value.data!.packageName;
      if (Get.find<AuthService>().used.value) {
        if (Get.find<AuthService>().isAuth) {
          print('SplashscreenController.onInit:$type');
          Get.offAllNamed(Routes.ROOT, arguments: type);
        } else {
        //  Get.offAllNamed(Routes.WELCOME);
     Get.offAllNamed(Routes.LOGIN);
        }
      } else {
        Get.offAllNamed(Routes.WELCOME);
      }
    });

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }


}
