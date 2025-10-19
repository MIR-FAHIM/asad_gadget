import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:asad_gadget/app/modules/phoneVerificationWtihOTP/repo/otp_repository.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/common/ui.dart';

class PhoneVerificationWtihOTPController extends GetxController {
  //TODO: Implement PhoneVerificationWtihOTPController

  RxInt codeVerifyTime = 60.obs;
  final mobileNumber = ''.obs;
  final isRegistered = ''.obs;
  final code = ''.obs;
  final codeController = TextEditingController().obs;
  late TextEditingController codeController2;

  final serviceTypeID = ''.obs;
  final newCode = ''.obs;
  @override
  void onInit() {
    super.onInit();

    mobileNumber.value = Get.arguments[0];
    print('my number is ______${mobileNumber.value}');
   sendOTP();
    verifyTimeStart();

    print(mobileNumber.value);
    initSmsListener();
    print("send otp");


  }

  void verifyTimeStart() {
    var duration = const Duration(seconds: 1);
    Timer.periodic(duration, (timer) {
      if (codeVerifyTime.value == 0) {
        timer.cancel();
      } else {
        codeVerifyTime.value -= 1;
      }
    });
  }

  Future<void> initSmsListener2() async {
    OTPInteractor().getAppSignature().then((value) => print('signature - $value'));

    codeController2 = OTPTextEditController(
      codeLength: 6,
      onCodeReceive: (code) {
        print('Your Application receive code - $code');
        print('Your Application receive code 2 - ${codeController2.text}');
      },
    )..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{6})');
          return exp.stringMatch(code ?? '') ?? '';
        },
        // strategies: [
        //   SampleStrategy(),
        // ],
      );

    print(codeController2.text);
  }

  Future<void> initSmsListener() async {
    // final deviceInfo = DeviceInfoPlugin();
    // final androidInfo = await deviceInfo.androidInfo;
    // final isAndroid14OrHigher = androidInfo.version.sdkInt >= 34;

    try {
      // Request SMS permissions if not already granted

      // Fetch app signature
      final signature = await OTPInteractor().getAppSignature();
      print('signature - $signature');

      // Clear previous code
      codeController.value.clear();

      // Initialize OTPTextEditController
      final otpController = OTPTextEditController(
        codeLength: 6,
        onCodeReceive: (code) {
          print('Your Application received code - $code');
          print('Your Application received code 2 - ${codeController.value.text}');
        },
      )..startListenUserConsent(
            (code) {
          final exp = RegExp(r'(\d{6})');
          codeController.value.addListener(() {
            newCode.value = exp.stringMatch(code ?? '') ?? '';
            codeController.value.text = newCode.value;
          });
          return exp.stringMatch(code ?? '') ?? '';
        },

      );

      // Start listening for user consent
      // otpController.startListenUserConsent(
      //       (code) {
      //     print('code 2: $code');
      //     final exp = RegExp(r'(\d{6})');
      //     codeController.value.addListener(() {
      //       final newCode = exp.stringMatch(code ?? '') ?? '';
      //       codeController.value.text = newCode;
      //     });
      //
      //     return exp.stringMatch(code ?? '') ?? '';
      //   },
      // strategies: [
      //   SampleStrategy(),
      // ],
      // Uncomment and add your strategies if needed
      // strategies: [SampleStrategy()],
      // );

      // Update the controller
      codeController.value = otpController;
    } catch (e) {
      print("Error is $e");
    }

    // Check if Android version is 34 or higher


  }

  sendOTP() async {
    print("i am here");
    OTPRepository().otpSend(mobileNumber.value).then((resp) {

    });
  }

  verifyOTP() async {
    Ui.customLoaderDialog();

    OTPRepository().verifyOTP(mobileNumber.value, codeController.value.text).then((resp) {
      if (resp['result'] == 'success') {
        Get.back();
        // Get.offAllNamed(Routes.LOGIN, arguments: mobileNumber.value);
        Get.toNamed(Routes.SHOP_INFO_REGISTER);

      } else {
        Get.back();
      }
    });
  }
// verifyOTP() async {
//   Ui.customLoaderDialog();
//   OTPRepository()
//       .verifyOTP(mobileNumber.value, codeController.text)
//       .then((resp) {
//     if (resp['result'] == 'success') {
//       Get.back();
//       if (isRegistered.value == '1') {
//         Get.offAllNamed(Routes.LOGIN, arguments: mobileNumber.value);
//       } else {
//         Get.defaultDialog(
//             titlePadding: const EdgeInsets.only(top: 12),
//             title: "Location Permission",
//             backgroundColor: Colors.white,
//             titleStyle: TextStyle(color: AppColors.primaryColor),
//             textConfirm: "Accept",
//             onConfirm: () {
//               var data = {
//                 "mobileNumber": mobileNumber.value,
//                 "locationPermission": 'true',
//               };

//               Get.offAllNamed(Routes.SIGNUP, arguments: data);
//               print("Confirm");
//             },
//             textCancel: "Decline",
//             onCancel: () {
//               var data = {
//                 "mobileNumber": mobileNumber.value,
//                 "locationPermission": 'false',
//               };

//               Get.offAllNamed(Routes.SIGNUP, arguments: data);
//               print("Cancel");
//             },
//             cancelTextColor: Colors.red,
//             confirmTextColor: Colors.white,
//             buttonColor: Colors.green,
//             barrierDismissible: false,
//             radius: 20,
//             content: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Container(
//                       child: Text(
//                     "Paystation collects your location so that our sales represntative can easily find your shop location & provide a quick service to you.",
//                     textAlign: TextAlign.justify,
//                     style:
//                         TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
//                   )),
//                 ),
//                 SizedBox(height: 10),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 12, right: 12),
//                   child: Container(
//                       child: Text(
//                     "By accepting, you agree to the PayStation's Terms of Service.",
//                     style: TextStyle(
//                         fontSize: 12, color: AppColors.primaryColor),
//                   )),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 12, right: 12, top: 6),
//                   child: Container(
//                       child: Text(
//                     "Note: The Privacy Policy describes how data is handled in this service.",
//                     style: TextStyle(
//                         fontSize: 12, color: AppColors.primaryColor),
//                   )),
//                 ),
//               ],
//             ));

//         // Get.offAllNamed(Routes.SIGNUP, arguments: mobileNumber.value);

//       }
//     } else {
//       Get.back();
//     }
//   });
// }

}
