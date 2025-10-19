import 'package:asad_gadget/app/modules/asadgadgets/order/controller/order_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:asad_gadget/app/models/ad_banner_model.dart';
import 'package:asad_gadget/app/models/agent_list_model.dart';
import 'package:asad_gadget/app/models/dashboardReportModel.dart';
import 'package:asad_gadget/app/models/get_permission_model.dart';
import 'package:asad_gadget/app/models/get_profile_info_model.dart';
import 'package:asad_gadget/app/modules/settings/controllers/language_controller.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/main.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final balance = '0.0'.obs;
  final phoneController = TextEditingController().obs;
  final outletNameController = TextEditingController().obs;
  final ownerController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final status = false.obs;
  final packageName = "".obs;
  final agentList = <DatumAgent>[].obs;
  final profileInfoModel = GetProfileInfo().obs;
  final packageLoad = false.obs;
  final ownerName = "".obs;

  final getPermissionModel = GetPermissionModel().obs;
  final AdBanner = <AdBannerModel>[].obs;
  final AdBannerLoad = false.obs;
  final box = GetStorage().obs;
  final contactsResult = <Contact>[].obs;
  final paymentCollectionModel = <PaymentCollectModel>[].obs;


  final dashboardReport = DahsboardReportModel().obs;
  @override
  Future<void> onInit() async {
    Get.put(OrderController());
    getLanguageSwitch();

    super.onInit();
    print('HomeController.onInit');
  }

  forFCM() {
    switch (type) {
      case '1':
        Get.toNamed(Routes.OFFER, arguments: type);
        break;
      case '2':
        Get.toNamed(Routes.RECHARGE_REPORT, arguments: type);
        break;
      case '3':
        Get.toNamed(Routes.TRANSACTION_HISTORY, arguments: type);
        break;
    }
  }

  getLanguageSwitch() {
    if (Get.find<LanguageController>().locale.value == 'en_US') {
      status.value = true;
    } else {
      status.value = false;
    }
  }

  getPhoneContact() async {
    box.value.remove('contact');
    if (await FlutterContacts.requestPermission()) {
      // Get all contacts (lightly fetched)
      List<Contact> contacts = await FlutterContacts.getContacts();

      // Get all contacts (fully fetched)
      contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);

      // Get contact with specific ID (fully fetched)

      print("my all contact are $contacts");

      contactsResult.value = contacts;
      await box.value.write('contact', contactsResult);
      print("hlw bro ***********************${GetStorage().read('contact')}");
    }
  }

  // void changeState() async {
  //   // getBalance();

  //   isAnimation.value = true;
  //   isBalance.value = false;

  //   await Future.delayed(
  //       Duration(milliseconds: 800), () => isBalanceShown.value = true);
  //   await Future.delayed(
  //       Duration(seconds: 3), () => isBalanceShown.value = false);
  //   await Future.delayed(
  //       Duration(milliseconds: 200), () => isAnimation.value = false);
  //   await Future.delayed(
  //       Duration(milliseconds: 800), () => isBalance.value = true);
  // }

  @override
  void onReady() {
    // TODO: implement onReady

    super.onReady();
  }
}

class PaymentCollectModel {
  String? title;
  String? amount;
  String? totalUser;
  PaymentCollectModel({this.amount, this.title, this.totalUser});
}
