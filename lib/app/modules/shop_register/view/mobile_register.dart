import 'package:asad_gadget/app/modules/global_widgets/block_button_widget.dart';
import 'package:asad_gadget/app/modules/global_widgets/text_field_widget.dart'; // Assuming this is your custom TextFieldWidget
import 'package:asad_gadget/app/modules/shop_register/controller/shop_register_controller.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:asad_gadget/common/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Correct import for SvgPicture

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:url_launcher/url_launcher.dart';

class CheckPhoneNumberView extends GetView<ShopRegisterController> {
  final userdata = GetStorage();
  @override
  Widget build(BuildContext context) {
    final _size = Get.size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SizedBox(
            width: _size.width,
            height: _size.height,
            child: SingleChildScrollView(
              // Wrap Stack content in SingleChildScrollView
              child: Column(
                children: [
                  const SizedBox(height: 100), // More space at the top

                  // Logo Section
                  Center(
                    child: SizedBox(
                      height: Get.size.width * .30, // Adjust height as needed
                      width: Get.size.width * .45, // Adjust width as needed
                      child: SvgPicture.asset(
                        // Corrected SvgPicture usage
                        'assets/white.svg', // Ensure this SVG exists and is correctly configured in pubspec.yaml
                        colorFilter: ColorFilter.mode(AppColors.primaryColor,
                            BlendMode.srcIn), // Use colorFilter for SVG color
                        height: 100.0, // Increased size for prominence
                        width: 150.0,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 60), // Space between logo and title

                  // "Enter Mobile Number" Title
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0), // Padding for text
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter Mobile Number'
                            .tr, // Changed text to match design
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28, // Larger font size
                          color: Colors.black87, // Darker text color
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30), // Space between title and input

                  // Mobile Number Input Field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      // Assuming TextFieldWidget is your custom widget

                      keyboardType: TextInputType.phone,
                      controller: controller
                          .phoneNumber.value, // Your existing controller
                      onChanged: (value) {
                        // You might want to add validation logic here if not already in controller
                        controller.isValidPhone.value =
                            value.length >= 10; // Simple validation example
                      },
                      // Add more styling as needed for border, focus, etc.
                      // Example:
                      decoration: InputDecoration(
                        hintText: 'Add Your Phone No',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.primaryColor, width: 2),
                        ),
                        prefixIcon: Icon(Icons.phone), // Example icon
                      ),
                    ),
                  ),
                  const SizedBox(height: 40), // Space before button

                  // Send OTP Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: BlockButtonWidget(
                      onPressed: () {
                        if (controller.isValidPhone.isTrue) {
                          controller.checkNumber();

                        } else {
                          Get.showSnackbar(Ui.ErrorSnackBar(
                              message: 'Please, Enter Valid Mobile Number'.tr,
                              title: 'Error'.tr));
                        }
                      },
                      color: AppColors.primaryColor, // Use your primary color
                      text: Text(
                        'Send OTP'.tr,
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
                  const SizedBox(height: 30), // Space before login link

                  // "Already have an account? Log In"
                  TextButton(
                    onPressed: () {
                      Get.toNamed(
                          Routes.LOGIN); // Assuming you have a login route
                    },
                    child: Text(
                      'Already have an account? Log In'.tr,
                      style: TextStyle(
                        color: AppColors.primaryColor, // Use your primary color
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Space at the bottom
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  // Your existing launchURL method
  launchURL() async {
    final String googleMapslocationUrl =
        "http://paystation.com.bd/Payment_Facilitation_Agreement_Sample_v2.pdf";
    final String encodedURl = Uri.encodeFull(googleMapslocationUrl);
    if (await canLaunch(encodedURl)) {
      await launch(encodedURl);
    } else {
      print('Could not launch $encodedURl');
      throw 'Could not launch $encodedURl';
    }
  }
}
