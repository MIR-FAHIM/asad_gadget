import 'package:asad_gadget/app/modules/global_widgets/block_button_widget.dart';
import 'package:asad_gadget/app/modules/shop_register/controller/shop_register_controller.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:asad_gadget/common/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class SetPassword extends GetView<ShopRegisterController> {
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
                  const SizedBox(height: 60), // Space between logo and title

                  // "Enter Mobile Number" Title
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0), // Padding for text
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Enter New Password'.tr, // Changed text to match design
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
                      controller:
                          controller.passWord.value, // Your existing controller
                      onChanged: (value) {},
                      // Add more styling as needed for border, focus, etc.
                      // Example:
                      decoration: InputDecoration(
                        hintText: 'Add Password',
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
                  const SizedBox(height: 20), // Space between title and input
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      // Assuming TextFieldWidget is your custom widget

                      keyboardType: TextInputType.phone,
                      controller: controller
                          .confirmPassWord.value, // Your existing controller
                      onChanged: (value) {},
                      // Add more styling as needed for border, focus, etc.
                      // Example:
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: BlockButtonWidget(
                      onPressed: () {
                        if (controller.passWord.value.text ==
                            controller.confirmPassWord.value.text) {
                          controller.submitRegistration(false);
                        } else {
                          Get.showSnackbar(Ui.ErrorSnackBar(
                              message: 'Password did not match!'.tr,
                              title: 'Error'.tr));
                        }
                      },
                      color: AppColors.primaryColor, // Use your primary color
                      text: Text(
                        'Confirm Pin'.tr,
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
          ),
        );
      }),
    );
  }
}
