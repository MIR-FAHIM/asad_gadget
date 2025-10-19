import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/common/loader/custom_loader.dart';
//new
class CustomFullScreenLoader{
  static void openLoadingDialog(String text, String animation){
    showDialog(context: Get.overlayContext!, builder: (_)=> WillPopScope(child: Container(
      color: Colors.white,
      width: Get.width,
      height: Get.height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           CustomAnimationLoader(text: text, animation: animation)
          ],
        ),
      ),
    ), onWillPop: (){
      return Future.value(false);
    },), barrierDismissible: false);
  }
  static void openLoadingDialogSmall(String text, String animation){
    showDialog(context: Get.overlayContext!, builder: (_)=> WillPopScope(child: Container(
      color: Colors.white,
      width: Get.width * .7,
      height: Get.height *.3,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           CustomAnimationLoader(text: text, animation: animation)
          ],
        ),
      ),
    ), onWillPop: (){
      return Future.value(false);
    },), barrierDismissible: false);
  }
  static stoploader(){
    Navigator.of(Get.context!).pop();
  }
}