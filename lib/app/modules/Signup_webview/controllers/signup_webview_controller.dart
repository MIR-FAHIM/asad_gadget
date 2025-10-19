// import 'dart:async';
// import 'dart:io';
//
// import 'package:get/get.dart';
// import 'package:asad_gadget/app/repositories/registartion_payment_repository.dart';
// import 'package:asad_gadget/app/routes/app_pages.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class SignupWebviewController extends GetxController {
//   //TODO: Implement WebviewController
//   late Completer<WebViewController> webcontroller;
//   final paymentUrl = ''.obs;
//   final title = ''.obs;
//   final progress = 0.0.obs;
//   final mobileNumber = ''.obs;
//   final isRegistered = ''.obs;
//   final isLoaded = false.obs;
//   final paymentDone = false.obs;
//   final serviceTypeID = ''.obs;
//   @override
//   void onInit() {
//     webcontroller = Completer<WebViewController>();
//     if (Platform.isAndroid) {
//       WebView.platform = AndroidWebView();
//     }
//     paymentUrl.value = Get.arguments['paymentURL'];
//     title.value = Get.arguments['title'];
//     mobileNumber.value = Get.arguments['mobileNumber'] ?? '';
//     isRegistered.value = Get.arguments['isRegistered'] ?? '';
//     serviceTypeID.value = Get.arguments['selectedServiceTypeId'] ?? '';
//
//     // PaymentCheck();
//
//     super.onInit();
//   }
//
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//   // void PaymentCheck() {
//   //   Timer.periodic(const Duration(seconds: 5), (timer) async {
//   //     RegistartionPaymentRepository().RegPaymentInfo(mobileNumber.value).then((resp) {
//   //       if (resp.result == 'success') {
//   //         if (resp.paymentStatus == 'paid') {
//   //           timer.cancel();
//   //           print("done");
//   //           //Get.toNamed(Routes.PHONE_VERIFICATION_WTIH_O_T_P, arguments: {'mobileNumber': mobileNumber.value, 'isRegistered': isRegistered.value});
//   //           Get.offAllNamed(Routes.SIGNUP, arguments: mobileNumber.value);
//   //         } else {
//   //           print('unpaid');
//   //         }
//   //       } else {
//   //         print("fail");
//   //       }
//   //     });
//   //   });
//   //
//   //   // Timer.periodic(const Duration(seconds: 5), (timer) async {
//   //   //   var url = 'https://dl.dropbox.com/s/4d6isp28ffg6ak3/registration.json';
//   //
//   //   //   var response = await http.get(Uri.parse(url));
//   //
//   //   //   var resp = json.decode(response.body);
//   //
//   //   //   var payment_status = resp['payment_status'];
//   //
//   //   //   if (payment_status == 'paid') {
//   //   //     timer.cancel();
//   //   //     print("done");
//   //   //     Get.offAllNamed(Routes.SIGNUP, arguments: mobileNumber.value);
//   //   //   } else {
//   //   //     print(resp);
//   //   //   }
//   //   // });
//   // }
// }
