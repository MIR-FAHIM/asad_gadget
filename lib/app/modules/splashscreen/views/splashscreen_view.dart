import 'package:asad_gadget/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/common/ui.dart';
import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    Get.find<SplashscreenController>();
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        height: _size.height,
        width: _size.width,
        child: Stack(
          children: [
            Center(
              child: Image(
                height: 200,
                width: 200,
                image: AssetImage(
                  'assets/asad_logo.png',
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Ui.customLoaderSplash(),
            )
          ],
        ),
      ),
    );
  }
}
