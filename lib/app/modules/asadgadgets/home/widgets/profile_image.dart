import 'dart:io';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:asad_gadget/app/modules/global_widgets/block_button_widget.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/common/Color.dart';

class ProfileImageView extends StatefulWidget {
  @override
  State<ProfileImageView> createState() => _ProfileImageViewState();
}

class _ProfileImageViewState extends State<ProfileImageView> {
  PickedFile? imageFile = null;
  final _size = Get.size;
  String? _imagepath;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    LoadImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(65, 65),
        child: AppBar(
          backgroundColor: Color(0xFF652981),
          centerTitle: true,
          title: Text('Add New Picture'.tr),
          elevation: 0,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Get.offAllNamed(Routes.ROOT)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: _size.width,
                    height: _size.height,
                    color: AppColors.SecondbackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 50),
                        InkWell(
                          onTap: () {
                            PickImage();
                            // _openCamera(context);
                          },
                          child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(99),
                              border: Border.all(
                                  color: Color.fromARGB(255, 192, 192, 192),
                                  width: 5),
                            ),
                            child: _imagepath != null
                                ? ClipOval(
                                    child: Image.file(
                                    File(_imagepath!),
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ))
                                : (imageFile == null)
                                    ? Center(
                                        child: Text(
                                        " Take New Picture",
                                        style: TextStyle(
                                            color: AppColors.homeCardBg),
                                      ))
                                    : ClipOval(
                                        child: Image.file(
                                        File(imageFile!.path),
                                        width: 130,
                                        height: 130,
                                        fit: BoxFit.cover,
                                      )),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            BlockButtonWidget(
                              onPressed: () {
                                // SaveImage(imageFile!.path);
                                SaveImage();
                              },
                              color: Color(0xFF652981),
                              text: Text(
                                "save".tr,
                                style: Get.textTheme.bodyMedium!
                                    .merge(TextStyle(color: Colors.white)),
                              ),
                            ).paddingSymmetric(vertical: 10, horizontal: 5),
                            BlockButtonWidget(
                              onPressed: () {
                                DeleteIamge();
                              },
                              color: Color(0xFF652981),
                              text: Text(
                                "delete".tr,
                                style: Get.textTheme.bodyMedium!
                                    .merge(TextStyle(color: Colors.white)),
                              ),
                            ).paddingSymmetric(vertical: 10, horizontal: 5),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    // Ui.customLoaderDialog();
    setState(() {
      imageFile = pickedFile! as PickedFile?;
    });

    // Navigator.pop(context);
  }

  Future<void> PickImage() async {
    // await DeleteIamge();
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    // Ui.customLoaderDialog();
    setState(() {
      imageFile = pickedFile! as PickedFile?;
    });
    SaveImage();
    await LoadImage();
  }

  Future<void> SaveImage() async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    saveimage.setString("imagepath", imageFile!.path);
  }

  Future<void> LoadImage() async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    setState(() {
      _imagepath = saveimage.getString("imagepath");
    });
  }

  Future<void> DeleteIamge() async {
    SharedPreferences saveimage = await SharedPreferences.getInstance();
    final success = await saveimage.remove('imagepath');
    print("delete");
  }
}
