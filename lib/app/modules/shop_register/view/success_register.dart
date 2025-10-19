import 'package:asad_gadget/app/modules/global_widgets/block_button_widget.dart';
import 'package:asad_gadget/app/modules/shop_register/controller/shop_register_controller.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SuccessShopRegister extends GetView<ShopRegisterController> {
  final userdata =
      GetStorage(); // This might not be directly used in the UI, but kept as per original
  @override
  Widget build(BuildContext context) {
    final _size = Get.size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        // Use SizedBox directly as it's a fixed layout for success
        width: _size.width,
        height: _size.height,
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Center content vertically
          children: [
            // Success Checkmark Icon
            Icon(
              Icons.check_circle, // Material icon for checkmark
              color: AppColors
                  .greenTextColor, // Use your primary color for the checkmark
              size: 120, // Large size for prominence
            ),
            const SizedBox(height: 30),

            // "Registration Successful" Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Registration Successful'.tr, // Text as per design
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center, // Center align the text
              ),
            ),
            const SizedBox(height: 15),

            // "Your account has been submitted for verification" message
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35.0),
              child: Text(
                'Your account has been submitted for verification'
                    .tr, // Text as per design
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
                textAlign: TextAlign.center, // Center align the text
              ),
            ),
            const SizedBox(height: 60), // Space before button

            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: BlockButtonWidget(
                onPressed: () {
                  // Navigate to the dashboard or home screen after successful registration
                  Get.offAllNamed(Routes
                      .SPLASHSCREEN); // Assuming HOME is your main route after login/registration
                },
                color: AppColors.primaryColor, // Use your primary color
                text: Text(
                  'Continue'.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                radius: 15, // Rounded corners for the button
                width: double.infinity, // Full width button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
