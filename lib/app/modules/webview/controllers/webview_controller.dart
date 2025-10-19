import 'dart:async';
import 'dart:io';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';




class WebviewController extends GetxController {
  //TODO: Implement WebviewController
  late InAppWebViewController inAppWebViewController;
  final paymentUrl = ''.obs;
  final title = ''.obs;
  final progress = 0.0.obs;

  final isLoaded = false.obs;

  @override
  void onInit() {
    paymentUrl.value = Get.arguments['paymentURL'];
    title.value = Get.arguments['title'];


    // if (Platform.isAndroid) WebView.platform = AndroidWebView();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
  Future<bool> handleBack() async {
    if (await inAppWebViewController.canGoBack()) {
      await inAppWebViewController.goBack();
      return false; // Don't exit the screen
    }
    return true; // Allow screen exit
  }
  void setWebViewController(InAppWebViewController controller) {
    inAppWebViewController = controller;
  }
}
