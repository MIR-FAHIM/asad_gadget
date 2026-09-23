import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/app/models/user_model.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/app/services/auth_service.dart';
import '../repositories/login_repository.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  final RxBool isPasswordVisible = false.obs;
  final RxBool isLoading = false.obs;
  final Rxn<UserModel> userModel = Rxn<UserModel>();

  late final LoginRepository _repository;

  @override
  void onInit() {
    super.onInit();
    _repository = Get.find<LoginRepository>();
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  Future<void> submitLogin() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }

    try {
      isLoading.value = true;
      final response = await _repository.login(
        username: usernameController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (response['status'] == 'success' || response['token'] != null) {
        // Parse and store UserModel inside controller
        final user = UserModel.fromJson(response);
        userModel.value = user;

        if (Get.isRegistered<AuthService>()) {
          Get.find<AuthService>().alreadyLogged.value = true;
        }

        Get.snackbar(
          'Success',
          response['message'] ?? 'Login successful!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );

        Get.offAllNamed(Routes.ROOT);
      } else {
        Get.snackbar(
          'Login Failed',
          response['message'] ?? 'Invalid email/phone or password',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      print('Login Exception: $e');
      Get.snackbar(
        'Error',
        'An unexpected error occurred: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void fillDemoCredentials() {
    usernameController.text = 'demo@asadgadget.com';
    passwordController.text = '12345678';
  }
}
