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
import 'package:image_picker/image_picker.dart';

// No need for url_launcher in this specific view, so removed if not used elsewhere
// import 'package:url_launcher/url_launcher.dart';

class RegisterShopInfo extends GetView<ShopRegisterController> {
  final userdata = GetStorage();

  // Placeholder controllers for demonstration.
  // In a real app, these would come from your ShopRegisterController.

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
              child: Column(
                children: [
                  const SizedBox(height: 70), // Adjusted space at the top

                  // Back Button (as seen in design)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios,
                            color: AppColors.primaryColor),
                        onPressed: () {
                          Get.back(); // Navigate back to the previous step
                        },
                      ),
                    ),
                  ),

                  // "Shop Information" Title
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Shop Information'
                            .tr, // Changed text to match Step 3 design
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const SizedBox(
                      height: 30), // Space between title and first input

                  // Shop Name Input Field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      // Using standard TextField for simplicity, assuming custom TextFieldWidget can be styled similarly
                      controller: controller.shopNameController
                          .value, // Replace with controller.shopNameController.value
                      decoration: InputDecoration(
                        hintText: 'Shop Name'.tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.primaryColor, width: 2),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(height: 20), // Space between inputs

                  // Owner Name Input Field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: controller.ownerNameController
                          .value, // Replace with controller.ownerNameController.value
                      decoration: InputDecoration(
                        hintText: 'Owner Name'.tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.primaryColor, width: 2),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: controller.email
                          .value, // Replace with controller.ownerNameController.value
                      decoration: InputDecoration(
                        hintText: 'Email'.tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.primaryColor, width: 2),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Address Input Field
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: controller.addressController
                          .value, // Replace with controller.addressController.value
                      decoration: InputDecoration(
                        hintText: 'Address'.tr,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: AppColors.primaryColor, width: 2),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: 3, // Multi-line input for address
                      textInputAction: TextInputAction.newline,
                    ),
                  ),
                  const SizedBox(height: 30), // Space before upload sections



                  controller.tradeImageFrontString.value.isNotEmpty ?
                  Column(
                    children: [
                      _buildButtonField(
                        hintText: 'Trade License',
                        optionalText: '(optional)',
                        icon: Icons.description,
                        buttonText:  'Re Upload',
                        onPressed: () {
                          _showImagePicker(context, controller, 'trade_front');
                        },
                      ),
                      Container(
                        height: Get.height*.15,
                        width: Get.width*8,
                        child: Image.file(
                            width: Get.width*.8,
                            fit: BoxFit.fill,
                            controller.tradeImageFrontFile.value),
                      ),

                    ],
                  )
                      :  _buildButtonField(
                    hintText: 'Trade License',
                    optionalText: '(optional)',
                    icon: Icons.description,
                    buttonText:  'Upload',
                    onPressed: () {
                      _showImagePicker(context, controller, 'trade_front');
                    },
                  ),

                  controller.nidString.value.isNotEmpty ?
                  Column(
                    children: [
                      _buildButtonField(
                        hintText: 'NID Card',
                        optionalText: '(optional)',
                        icon: Icons.description,
                        buttonText:  'Re Upload',
                        onPressed: () {
                          _showImagePicker(context, controller, 'nid_front');
                        },
                      ),
                      Container(
                        height: Get.height*.15,
                        width: Get.width*8,
                        child: Image.file(
                            width: Get.width*.8,
                            fit: BoxFit.fill,
                            controller.nidFile.value),
                      ),

                    ],
                  )
                      :
                  // NID Card (optional)
                  _buildButtonField(
                    hintText: 'NID Card',
                    optionalText: '(optional)',
                    icon: Icons.credit_card,
                    buttonText: 'Upload',
                    onPressed: () {
                      _showImagePicker(context, controller, 'nid_front');
                    },
                  ),// Space before submit button
                  controller.shopImageString.value.isNotEmpty ?
                  Column(
                    children: [
                      _buildButtonField(
                        hintText: 'Shop Image',
                        optionalText: '(optional)',
                        icon: Icons.description,
                        buttonText:  'Re Upload',
                        onPressed: () {
                          _showImagePicker(context, controller, 'shop');
                        },
                      ),
                      Container(
                        height: Get.height*.15,
                        width: Get.width*8,
                        child: Image.file(
                            width: Get.width*.8,
                            fit: BoxFit.fill,
                            controller.shopImage.value),
                      ),

                    ],
                  )
                      :
                  _buildButtonField(
                    hintText: 'Shop Image',
                    icon: Icons.camera_alt,
                    buttonText: 'Upload',
                    onPressed: () {
                      _showImagePicker(context, controller, 'shop');
                    },
                  ),
                  // Submit Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: BlockButtonWidget(
                      onPressed: () {
                        // Implement form submission logic here
                        print('Submit Shop Info pressed');
                        // Example navigation to next step (Set Password)
                        Get.toNamed(Routes
                            .SET_PASSWORD); // Assuming you have a SET_PASSWORD route
                      },
                      color: AppColors.primaryColor,
                      text: Text(
                        'Submit'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      radius: 15,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(height: 40), // Space at the bottom
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
  void _showImagePicker(BuildContext context, ShopRegisterController controller, String type) {
    Get.bottomSheet(
      Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(2))),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text('Photo Library'.tr),
                onTap: () {
                  controller.getImageAndroid13(ImageSource.gallery, type);
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: Text('Camera'.tr),
                onTap: () {
                  controller.getImageAndroid13(ImageSource.camera, type);
                  Get.back();
                },
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildButtonField({
    required String hintText,
    required IconData icon,
    required String buttonText,
    required VoidCallback onPressed,
    String? optionalText,
    TextEditingController? controller,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.orange),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      hintText,
                      style: const TextStyle(
                          color: Colors.black54, fontSize: 16.0),
                    ),
                    if (optionalText != null)
                      Text(
                        optionalText,
                        style: const TextStyle(
                            color: Colors.black38, fontSize: 12.0),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: const BorderSide(color: Colors.orange),
                  ),
                ),
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Helper method to build consistent upload sections
  Widget _buildUploadSection({
    required BuildContext context,
    required String label,
    required VoidCallback onUploadPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          BlockButtonWidget(
            onPressed: onUploadPressed,
            color: AppColors
                .primaryColor, // Or a secondary color for upload buttons
            text: Text(
              'Upload'.tr,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            radius: 10,
            width: Get.size.width * 0.25, // Smaller width for upload buttons
          ),
        ],
      ),
    );
  }
}
