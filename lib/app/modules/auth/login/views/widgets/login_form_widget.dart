import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/common/Color.dart';
import '../../controllers/login_controller.dart';

class LoginFormWidget extends StatelessWidget {
  final LoginController controller;

  const LoginFormWidget({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Email/Phone Input Field
          TextFormField(
            controller: controller.usernameController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email or Mobile Number',
              hintText: 'e.g. demo@asadgadget.com or 01700000000',
              prefixIcon: const Icon(Icons.person_outline, color: AppColors.greyText),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: AppColors.lightGrey,
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email or mobile number';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Password Input Field
          Obx(
            () => TextFormField(
              controller: controller.passwordController,
              obscureText: !controller.isPasswordVisible.value,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock_outline, color: AppColors.greyText),
                suffixIcon: IconButton(
                  icon: Icon(
                    controller.isPasswordVisible.value
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.greyText,
                  ),
                  onPressed: controller.togglePasswordVisibility,
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: AppColors.lightGrey,
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your password';
                }
                if (value.trim().length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 12),

          // Forgot Password Row
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Get.snackbar(
                  'Forgot Password',
                  'Password reset link would be sent to your email/phone',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Submit Login Button
          Obx(
            () => SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: controller.isLoading.value ? null : controller.submitLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: controller.isLoading.value
                    ? const SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5),
                      )
                    : const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Demo Credentials Fill Button
          OutlinedButton.icon(
            onPressed: controller.fillDemoCredentials,
            icon: const Icon(Icons.auto_fix_high, size: 18),
            label: const Text('Auto-fill Demo Credentials'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}
