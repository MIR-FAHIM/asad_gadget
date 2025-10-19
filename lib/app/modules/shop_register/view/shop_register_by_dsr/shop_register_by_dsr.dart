import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:asad_gadget/common/ui.dart';
import 'package:flutter/material.dart';
import 'package:asad_gadget/app/modules/shop_register/controller/shop_register_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ShopRegisterByDsr extends GetView<ShopRegisterController> {
  const ShopRegisterByDsr({super.key});
  @override

  // A custom text field widget to simplify the form creation.
  Widget _buildTextField(
      {required String hintText,

      required IconData icon,
      bool isOptional = false,
      TextEditingController? controller,
      bool isReadOnly = false,
      bool isNumber = false,
      VoidCallback? onTap,
      Widget? trailingWidget}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: TextFormField(
        controller: controller,
        readOnly: isReadOnly,
        maxLength: isNumber == true ? 11 : 100,
        keyboardType: isNumber == true ? TextInputType.number : TextInputType.text,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hintText,

          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: Colors.orange),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          suffixIcon: trailingWidget,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        ),
      ),
    );
  }

  // A custom widget for the fields with an "Upload" or "Get Location" button.
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

  // A custom widget for the Visit Day field.
  Widget _buildVisitDayField({
    required String hintText,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Row(
              children: [
                Icon(icon, color: Colors.orange),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Text(
                    hintText,
                    style: const TextStyle(color: Colors.grey, fontSize: 16.0),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_right, color: Colors.grey),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: SingleChildScrollView(
        child: Obx(
        () {
            return Column(
              children: [
                const SizedBox(height: 20),
                // Shop Name
                _buildTextField(
                  hintText: 'Shop Name',
                  icon: Icons.store,
                  controller: controller.shopNameController.value,
                ),
                // Owner Name
                _buildTextField(
                  hintText: 'Owner Name',
                  icon: Icons.person,
                  controller: controller.ownerNameController.value,
                ),

                _buildTextField(
                  hintText: 'Email',
                  icon: Icons.email,
                  controller: controller.email.value,
                ),
                // Address
                _buildTextField(
                  hintText: 'Address',
                  icon: Icons.location_on,
                  controller: controller.addressController.value,
                ),
                // Mobile Number
                _buildTextField(
                  isNumber: true,
                  hintText: 'Mobile Number',
                  icon: Icons.phone_android,
                  controller: controller.phoneNumber.value,
                ),
                // Trade License (optional)

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
                ),
                // Area / Zone
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child:
                       DropdownButtonFormField<int>(
                        value: controller.selectedZoneId.value == 0 ? null : controller.selectedZoneId.value,
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: 'Select Zone',
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(Icons.location_city, color: Colors.orange),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                          const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                        ),
                        iconEnabledColor: Colors.orange,
                        items: (controller.zoneList.value ?? [])
                            .map<DropdownMenuItem<int>>((z) => DropdownMenuItem<int>(
                          value: z.id, // <-- your zone id field
                          child: Text(
                            z.districtName ?? 'Unnamed Zone', // <-- your zone name field
                            style: const TextStyle(color: Colors.black87),
                          ),
                        ))
                            .toList(),
                        onChanged: (v) {
                          controller.selectedZoneId.value = v ?? 0;
                          // If you need to also mirror into a controller form:
                          // controller.selectedZoneId.value = _selectedZoneId.value;
                        },
                      )

                  ),
                ),
                // Visit Day
                _buildVisitDayField(
                 hintText: controller.visitDays.isEmpty
                ? 'Visit Day'
                    : 'Visit Day: ${controller.visitDays.join(", ")}',
                  icon: Icons.calendar_today,
                  onTap: () {
                    _openVisitDayPicker(context);
                  },
                ),
                // Shop Location
                _buildButtonField(
                  hintText: 'Shop Location',
                  icon: Icons.map,
                  buttonText: 'Get Location',
                  onPressed: () {
                   Get.toNamed(Routes.MAP_SELECTION);
                  },
                ),
                // Shop Location URL placeholder
                _buildTextField(
                  hintText: 'https://maps.google.com/u?q=qaHaUEZO aaki',
                  icon: Icons.location_on,
                  controller: controller.shopName.value,
                  isReadOnly: true,
                ),
                // Shop Image

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
                const SizedBox(height: 30),
                // Submit Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.passWord.value.text = '12345678';

                        if(controller.shopNameController.value.text.isEmpty || controller.email.value.text.isEmpty || controller.addressController.value.text.isEmpty){
                          Get.showSnackbar(
                              Ui.ErrorSnackBar(message: "Check Shop Name, Email and Address", title: 'Error'.tr));
                        }
                        else if(controller.phoneNumber.value.text.length != 11){

                          Get.showSnackbar(
                              Ui.ErrorSnackBar(message: "Give a valid mobile number", title: 'Error'.tr));
                        }else{
                          controller.submitRegistration(true);
                        }

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          }
        ),
      ),
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
  // Helper method to build consistent upload sections
  Future<void> _openVisitDayPicker(BuildContext context) async {
    // Temp selection so cancel doesn't mutate main state
    final temp = controller.visitDays.value.toSet(); // use a set for quick toggle
    await showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text("Select Visit Days"),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: controller.weekdayLabels.value.map((d) {
                final isChecked = temp.contains(d);
                return CheckboxListTile(
                  dense: true,
                  title: Text(d),
                  value: isChecked,
                  onChanged: (v) {
                    if (v == true) {
                      temp.add(d);
                    } else {
                      temp.remove(d);
                    }
                    // rebuild dialog
                    (ctx as Element).markNeedsBuild();
                  },
                );
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
Get.back();
              },
              child: const Text("Apply"),
            ),
          ],
        );
      },
    );
  }
}
