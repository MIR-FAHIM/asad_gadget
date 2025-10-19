import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../../routes/app_pages.dart';
import '../controllers/webview_controller.dart';

class WebviewView extends GetView<WebviewController> {


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.handleBack, // Use the back handling from the controller
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Add Balance", style:TextStyle(color:Colors.black)),
          ),
          body: Stack(
            children: [
              InAppWebView(
                key: GlobalKey(),
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    transparentBackground: true,
                  ),
                ),
                initialUrlRequest: URLRequest(url: WebUri(controller.paymentUrl.value)),
                onWebViewCreated: (InAppWebViewController webController) {
                  controller.setWebViewController(webController); // Pass controller instance
                },
                onProgressChanged: (InAppWebViewController webController, int progress) {
                  controller.progress.value = progress / 100; // Update progress
                },
              ),
              Obx(
                    () => controller.progress.value < 1
                    ? LinearProgressIndicator(value: controller.progress.value)
                    : SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
