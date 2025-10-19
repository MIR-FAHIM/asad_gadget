// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:asad_gadget/app/modules/signup_service_fee_confirm/controllers/signup_service_fee_confirm_controller.dart';
// import 'package:asad_gadget/common/ui.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import '../controllers/signup_webview_controller.dart';
//
// class SignupWebviewView extends GetView<SignupWebviewController> {
//   final GlobalKey webViewKey = GlobalKey();
//
//   // InAppWebViewController? webViewController;
//   // InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
//   //     crossPlatform: InAppWebViewOptions(
//   //       useShouldOverrideUrlLoading: true,
//   //       mediaPlaybackRequiresUserGesture: false,
//   //     ),
//   //     android: AndroidInAppWebViewOptions(
//   //       useHybridComposition: true,
//   //     ),
//   //     ios: IOSInAppWebViewOptions(
//   //       allowsInlineMediaPlayback: true,
//   //     ));
//
//   String url = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         resizeToAvoidBottomInset: true,
//         appBar: PreferredSize(
//           preferredSize: Size(65, 65),
//           child: AppBar(
//             backgroundColor: Color(0xFF652981),
//             automaticallyImplyLeading: false,
//             centerTitle: true,
//             title: Text("Registration Payment".tr),
//             elevation: 0,
//             // leading: IconButton(
//             //   icon: const Icon(Icons.arrow_back_ios),
//             //   onPressed: () {
//             //     Get.back();
//             //     // Get.put(SignupServiceFeeConfirmController()).getRegPaymentUrl();
//             //   },
//             // ),
//           ),
//         ),
//         body: Obx(() {
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//
//                 Container(
//                   height:controller.paymentDone.value == true ?MediaQuery.of(context).size.height - 30 : MediaQuery.of(context).size.height,
//                   child:
//                       WebView(
//                         initialUrl: controller.paymentUrl.value.replaceAll('https', 'http'),
//                         javascriptMode: JavascriptMode.unrestricted,
//                         onWebViewCreated: (WebViewController webViewController) {
//                           controller.webcontroller.complete(webViewController);
//                         },
//                         onPageStarted: (String string) async {
//                           print('SignupWebviewView.build current url: $string');
//                           if (string.contains('status=Successful')) {
//                             controller.paymentDone.value = true;
//
//                             Get.put(SignupServiceFeeConfirmController()).getRegPaymentUrl();
//                           } else if(string.contains('status=Failed')){
//                             Get.showSnackbar(Ui.ErrorSnackBar(
//                                 message:"Payment Failed. Try again please.", title: 'Error'.tr));
//                           }
//                         },
//                         onPageFinished: (finish) {
//                           print(finish);
//
//                           controller.isLoaded.value = true;
//                         },
//                         onWebResourceError: (error) {
//                           print(error.description);
//                         },
//                       ),
//                      // controller.isLoaded.isFalse ? Center(child: Ui.customLoader()) : Wrap(),
//
//                 ),
//           controller.paymentDone.value == true ? Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GestureDetector(
//               onTap: (){
//                 Get.put(SignupServiceFeeConfirmController()).goSignUp();
//               },
//               child: Container(
//                 height: 50,
//                 width: 200,
//                 decoration: Ui.getBoxDecoration(
//                     color: Color(0xFF652981), radius: 10),
//                 child: Center(
//                   child: Text("Sign Up", style: (
//           TextStyle(
//           fontSize: 15,
//           fontWeight: FontWeight.normal,
//           color: Colors.white,
//           )
//                   ),),
//                 ),
//               ),
//             ),
//           ) : Container(),
//
//               ],
//             ),
//           );
//         })
//
//         // InAppWebView(
//         //   key: webViewKey,
//         //   initialUrlRequest: URLRequest(url: Uri.parse(controller.paymentUrl.value)),
//         //   initialOptions: InAppWebViewGroupOptions(android: AndroidInAppWebViewOptions(mixedContentMode: AndroidMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW)),
//         //   onWebViewCreated: (controller) {
//         //     webViewController = controller;
//         //   },
//         //   androidOnPermissionRequest: (controller, origin, resources) async {
//         //     return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
//         //   },
//         //   //   onProgressChanged: (wcontroller, progress) {
//         //   //     if (progress == 100) {}
//         //   //     controller.progress.value = 1.0;
//         //   //   },
//         //   //   onConsoleMessage: (controller, consoleMessage) {
//         //   //     print(consoleMessage);
//         //   //   },
//         //   // ),
//         //   // controller.progress.value < 1.0
//         //   //     ? Center(
//         //   //         child: Container(
//         //   //           height: 100,
//         //   //           width: 100,
//         //   //           child: CircularProgressIndicator(),
//         //   //         ),
//         //   //       )
//         //   //     : Container(),
//         // ),
//
//         // InAppWebView(
//         //   initialUrlRequest: URLRequest(url: Uri.parse(controller.paymentUrl.value)),
//         //   initialOptions: InAppWebViewGroupOptions(android: AndroidInAppWebViewOptions(mixedContentMode: AndroidMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW)),
//         // ),
//         );
//   }
// }
