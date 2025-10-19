import 'package:get/get.dart';

import '../controllers/phone_verification_wtih_o_t_p_controller.dart';

class PhoneVerificationWtihOTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhoneVerificationWtihOTPController>(
      () => PhoneVerificationWtihOTPController(),
    );
  }
}
