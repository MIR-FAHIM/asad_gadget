import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:asad_gadget/common/ui.dart';
import '../controllers/phone_verification_wtih_o_t_p_controller.dart';

class PhoneVerificationWtihOTPView
    extends GetView<PhoneVerificationWtihOTPController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.themeAppColor,
        centerTitle: true,
        title: Text('Mobile Number Verification'.tr,
            style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: Obx(() {
        return GestureDetector(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: Get.size.width * .5,
                    width: Get.size.width * .6,
                    child:new SvgPicture.asset(
                      'assets/white.svg',
                      color:AppColors.primaryColor,
                      height: 50.0,
                      width: 150.0,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    20.0,
                  ),
                  child: Text(
                    'Verify Your Mobile Number'.tr,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: AppColors.themeAppColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Obx(() {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(
                          20.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Verification Code'.tr,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            controller.codeVerifyTime.value == 0
                                ? ElevatedButton(
                                    onPressed: () {
                                      controller.sendOTP();
                                      controller.initSmsListener();
                                      controller.codeVerifyTime.value = 180;
                                      controller.verifyTimeStart();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.themeAppColor,
                                    ),
                                    child: Text(
                                      'Resend Code'.tr,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ))
                                : Text(
                                    'Resend code after'.tr +
                                        ' ${controller.codeVerifyTime.value}s',
                                  )
                            // Obx(() {
                            //   if (controller.codeVerifyTime.value == 0) {
                            //     return ElevatedButton(
                            //         onPressed: () {
                            //           controller.sendOTP();
                            //           controller.initSmsListener();
                            //           controller.codeVerifyTime.value = 60;
                            //           controller.verifyTimeStart();
                            //         },
                            //         style: ElevatedButton.styleFrom(
                            //           primary: AppColors.themeAppColor,
                            //         ),
                            //         child: Text(
                            //           'Resend Code'.tr,
                            //           style: TextStyle(
                            //             fontSize: 16,
                            //             color: Colors.white,
                            //           ),
                            //         ));
                            //   } else {
                            //     return Text(
                            //       'Resend code after'.tr + ' ${controller.codeVerifyTime.value}s',
                            //     );
                            //   }
                            // }),
                          ],
                        ),
                      ),
                      Obx(() {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(6, (index) {
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Container(
                                  width: Get.size.width * .12,
                                  height: Get.size.width * .15,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        width: 2,
                                        color: Get.theme.primaryColor,
                                      )),
                                  child: Center(
                                    child: Text(
                                      controller.newCode.isNotEmpty
                                          ? controller.newCode.value[index]
                                          : '',
                                      style: TextStyle(
                                        color: Get.theme.primaryColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );

                        //     Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        //   child: PinCodeTextField(
                        //     appContext: context,
                        //     pastedTextStyle: TextStyle(
                        //       color: Colors.green.shade600,
                        //       fontWeight: FontWeight.bold,
                        //     ),
                        //     length: 6,
                        //     obscureText: false,
                        //     animationType: AnimationType.fade,
                        //     readOnly: false,
                        //     pinTheme: PinTheme(
                        //       shape: PinCodeFieldShape.box,
                        //       borderRadius: BorderRadius.circular(10),
                        //       fieldHeight: 50,
                        //       fieldWidth: 40,
                        //       inactiveFillColor: Colors.white,
                        //       inactiveColor: Colors.grey,
                        //       selectedColor: const AppColors.themeAppColor,
                        //       selectedFillColor: Colors.white,
                        //       activeFillColor: Colors.white,
                        //       activeColor: const AppColors.themeAppColor,
                        //     ),
                        //     cursorColor: Colors.black,
                        //     animationDuration: const Duration(milliseconds: 300),
                        //     enableActiveFill: false,
                        //     controller: controller.codeController2,
                        //     keyboardType: TextInputType.number,
                        //     enabled: true,
                        //     textStyle: const TextStyle(
                        //       color: AppColors.themeAppColor,
                        //     ),
                        //     boxShadows: [
                        //       BoxShadow(
                        //         offset: const Offset(0, 1),
                        //         color: controller.code.value == '1' ? Colors.black12 : Colors.black12,
                        //         blurRadius: 10,
                        //       )
                        //     ],
                        //     onCompleted: (v) {
                        //       controller.code.value = '1';
                        //       //do something or move to next screen when code complete
                        //     },
                        //     onChanged: (value) {
                        //       controller.code.value = '1';
                        //       print(value);
                        //     },
                        //   ),
                        // );
                      }),
                    ],
                  );
                }),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: RichText(
                      text: TextSpan(
                        text: "A verification has been sent to this number".tr +
                            " +88${controller.mobileNumber.value}.",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' ( Change Number ) '.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.themeAppColor,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.back();
                              },
                          ),
                        ],
                      ),
                    )),
                // Padding(
                //   padding: const EdgeInsets.all(20.0),
                //   child: Container(
                //     //height: 100,
                //     width: Get.size.width,
                //     decoration: BoxDecoration(
                //       color:  AppColors.themeAppColor,
                //       borderRadius: BorderRadius.circular(20),
                //     ),
                //     child: Center(
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                //         child: Text(
                //           "Don't share your pin and verification code with anyone.".tr,
                //           style: const TextStyle(
                //             color: Colors.white,
                //             fontSize: 20,
                //           ),
                //           textAlign: TextAlign.center,
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          controller.verifyOTP();
        },
        child: Container(
          height: 60,
          decoration: Ui.getBoxDecoration(color: Colors.white, radius: 0),
          child: Stack(
            children: [
              Container(
                width: Get.size.width,
                height: 60,
                color: Colors.white,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Confirm'.tr,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: AppColors.themeAppColor,
                      ),
                    ),
                  )),
              Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      controller.verifyOTP();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward,
                        color: AppColors.themeAppColor,
                        size: 40,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
