import 'package:asad_gadget/app/modules/asadgadgets/home/controllers/home_controller.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:asad_gadget/app/modules/settings/controllers/language_controller.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/app/services/auth_service.dart';
import 'package:asad_gadget/service/shared_pref.dart';
import 'package:url_launcher/url_launcher.dart';
import 'drawer_link_widget.dart';

class MainDrawerWidget extends StatelessWidget {
  final _size = Get.size;
  final userdata = GetStorage();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.offAllNamed(Routes.ROOT);
        return Future.value(false);
      },
      child: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //         Center(
                //   child: Text(
                //         'Pay Plus'.tr,
                //         style: const TextStyle(
                //           fontSize: 35,
                //           color: Color(0xFF652981),
                //         ),
                //   ),
                // ),
                const Image(
                  image: AssetImage('assets/Logo.png'),
                  height: 40,
                  width: 100,
                ),
              ],
            )),
            // Obx(() {
            //   return Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Container(
            //           width: _size.width * .25,
            //           height: _size.width * .09,
            //           decoration: Ui.getBoxDecoration(
            //             color: Get.find<LanguageController>().locale.value == 'bn_BD' ? Color(0xFF652981) : Colors.white,
            //             radius: 5,
            //           ),
            //           child: Padding(
            //             padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
            //             child: Center(
            //               child: Text(
            //                 'বাংলা',
            //                 style: TextStyle(color: Get.find<LanguageController>().locale.value == 'bn_BD' ? Colors.white : Color(0xFF652981)),
            //               ),
            //             ),
            //           ),
            //         ),
            //         Container(
            //           child: FlutterSwitch(
            //             width: 60.0,
            //             height: 35.0,
            //             valueFontSize: 25.0,
            //             toggleSize: 25.0,
            //             value: Get.find<HomeController>().status.value,
            //             borderRadius: 30.0,
            //             padding: 8.0,
            //             activeColor: Color(0xFF652981),
            //             showOnOff: false,
            //             onToggle: (val) {
            //               Get.find<HomeController>().status.value = val;
            //               if (Get.find<HomeController>().status.value == true) {
            //                 Get.find<LanguageController>().updateLocale('en_US');
            //               } else {
            //                 Get.find<LanguageController>().updateLocale('bn_BD');
            //               }
            //             },
            //           ),
            //         ),
            //         GestureDetector(
            //           onTap: () {
            //             Get.find<LanguageController>().updateLocale('en_US');
            //           },
            //           child: Container(
            //             width: _size.width * .25,
            //             height: _size.width * .09,
            //             decoration: Ui.getBoxDecoration(
            //               color: Get.find<LanguageController>().locale.value == 'en_US' ? Color(0xFF652981) : Colors.white,
            //               radius: 5,
            //             ),
            //             child: Padding(
            //               padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
            //               child: Center(
            //                 child: Text(
            //                   'English'.tr,
            //                   style: TextStyle(color: Get.find<LanguageController>().locale.value == 'en_US' ? Colors.white : Color(0xFF652981)),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   );
            // }),

            // DrawerLinkWidget(
            //   icon: 'assets/drawer/7.png',
            //   text: "Account Setting".tr,
            //   onTap: (e) {
            //     Get.toNamed(Routes.ACCOUNT_SETTING);
            //   },
            // ),

            Get.find<HomeController>()
                        .getPermissionModel
                        .value
                        .data!
                        .allowMbanking ==
                    1
                ? DrawerLinkWidget(
                    icon: 'assets/drawer/4.png',
                    text: "Withdraw money".tr,
                    onTap: (e) {
                      Get.toNamed(Routes.WITHDRAW);
                    },
                  )
                : Container(),

            // DrawerLinkWidget(
            //   icon: 'assets/drawer/4.png',
            //   text: "Change Account".tr,
            //   onTap: (e) {
            //     Get.toNamed(Routes.CHANGEACCOUNT);
            //   },
            // ),
            // DrawerLinkWidget(
            //   icon: 'assets/drawer/account_statement.png',
            //   text: "Current Package".tr,
            //   onTap: (e) {
            //     Get.toNamed(Routes.PACKAGELIST);
            //   },
            // ),

            // Padding(
            //   padding: const EdgeInsets.only(right: 16),
            //   child: ExpandablePanel(
            //     collapsed: const SizedBox(
            //       height: 10,
            //     ),
            //     header: DrawerLinkWidget(
            //       icon: 'assets/drawer/3.png',
            //       text: "Report".tr,
            //       id: 0,
            //       onTap: (e) {},
            //     ),
            //     expanded: Padding(
            //       padding: const EdgeInsets.only(left: 20),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           // DrawerLinkWidget(
            //           //   icon: 'assets/drawer/account_statement.png',
            //           //   text: "Account Statement".tr,
            //           //   onTap: (e) {
            //           //     Get.toNamed(Routes.ACCOUNTSTATEMENT);
            //           //   },
            //           // ),
            //           SizedBox(
            //             height: 10,
            //           ),
            //           DrawerLinkWidget(
            //             icon: 'assets/drawer/3.png',
            //             text: "Daily Report".tr,
            //             onTap: (e) {
            //               Get.toNamed(Routes.DAILY_REPORT);
            //             },
            //           ),
            //           // SizedBox(
            //           //   height: 10,
            //           // ),
            //           // DrawerLinkWidget(
            //           //   icon: 'assets/drawer/3.png',
            //           //   text: "Report Analytic".tr,
            //           //   onTap: (e) {
            //           //     Get.toNamed(Routes.REPORTANALITYC);
            //           //   },
            //           // ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),

            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ExpandablePanel(
                collapsed: const SizedBox(
                  height: 10,
                ),
                header: DrawerLinkWidget(
                  icon: 'assets/drawer/6.png',
                  text: "Privacy Policy".tr,
                  id: 0,
                  onTap: (e) async {},
                ),
                expanded: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DrawerLinkWidget(
                        icon: 'assets/drawer/2.png',
                        text: "Hotline".tr,
                        onTap: (e) {
                          Get.toNamed(Routes.HOTLINE);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DrawerLinkWidget(
                        icon: 'assets/drawer/terms.png',
                        text: "Terms & Conditions".tr,
                        onTap: (e) async {
                          Uri url = Uri.parse(
                              'https://shl.com.bd/terms-and-conditions.php');
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            print("can not load this url");
                          }
                        },
                      ),
                      // DrawerLinkWidget(
                      //   icon: 'assets/drawer/terms.png',
                      //   text: "Test Module".tr,
                      //   onTap: (e) async {
                      //  Get.toNamed(Routes.COLLECTORHOMEPAGE);
                      //   },
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      DrawerLinkWidget(
                        icon: 'assets/drawer/terms.png',
                        text: "Privacy Policy".tr,
                        onTap: (e) async {
                          final String urlString =
                              "https://raw.githubusercontent.com/musabbir-mamun/app-privacy-policy/master/paystation/paystation.html";

                          Uri url = Uri.parse(urlString);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            print("can not load this url");
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ExpandablePanel(
                collapsed: const SizedBox(
                  height: 10,
                ),
                header: DrawerLinkWidget(
                  icon: 'assets/drawer/7.png',
                  text: "Settings".tr,
                  id: 0,
                  onTap: (e) async {},
                ),
                expanded: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          print(Get.find<LanguageController>().locale.value ==
                              'en_US');
                          if (GetStorage().read<String>('language') ==
                              'en_US') {
                            Get.find<LanguageController>()
                                .updateLocale('bn_BD');
                          } else {
                            Get.find<LanguageController>()
                                .updateLocale('en_US');
                          }
                        },
                        child: Padding(
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, left: 20, right: 10),
                            child: Container(
                              width: _size.width,
                              height: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        const Image(
                                          image: AssetImage(
                                              'assets/drawer/language.png'),
                                          height: 25,
                                          width: 25,
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          width: 1,
                                          height: 28,
                                          color: Get.theme.dividerColor
                                              .withOpacity(0.2),
                                        ),
                                        Expanded(
                                          child: Text('Language Change'.tr,
                                              style: Get.textTheme.bodyMedium!
                                                  .merge(const TextStyle(
                                                      fontSize: 16))),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 25,
                                    width: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        width: 1,
                                        color: const Color(0xFF652981),
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        GetStorage().read<String>('language') ==
                                                'en_US'
                                            ? 'বাংলা'
                                            : 'English',
                                        style: const TextStyle(
                                          color: const Color(0xFF652981),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DrawerLinkWidget(
                        icon: 'assets/drawer/6.png',
                        text: "Change Pin".tr,
                        onTap: (e) {
                          Get.toNamed(Routes.CHANGE_PASSWORD);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DrawerLinkWidget(
                        icon: 'assets/drawer/deactivate_account.png',
                        text: "Account Deactivate".tr,
                        onTap: (e) {
                          Get.toNamed(Routes.DEACTIVATE_ACCCOUNT);
                          // Get.toNamed(Routes.Test);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DrawerLinkWidget(
                        icon: 'assets/drawer/1.png',
                        text: "Sign Out".tr,
                        id: 1,
                        onTap: (e) async {
                          SharedPreferences saveimage =
                              await SharedPreferences.getInstance();

                          Get.find<AuthService>().removeCurrentUser();
                          SharedPreff.to.prefss.remove("logindate");

                          Get.offAndToNamed(Routes.SPLASHSCREEN);
                        },
                      ),
                      DrawerLinkWidget(
                        icon: 'assets/drawer/deactivate_account.png',
                        text: "App Version: 7".tr,
                        onTap: (e) {
                          //  Get.toNamed(Routes.DEACTIVATE_ACCCOUNT);
                          // Get.toNamed(Routes.Test);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
