import 'package:asad_gadget/app/modules/asadgadgets/home/controllers/home_controller.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:asad_gadget/app/modules/global_widgets/main_drawer_widget.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  @override
  Widget build(BuildContext context) {

    return Obx(() {

      return WillPopScope(
        onWillPop: () async {
          // bool value = false;
          // Get.toNamed(Routes.ROOT);
          final value = await showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text('Are you sure you want to exit?'),
                  actions: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      //return false when click on "NO"
                      child: Text('No'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      //return true when click on "Yes"
                      child: Text('Yes'),
                    ),
                  ],
                );
              });
          return value == true;
        },
        child: Scaffold(
          body: controller.currentPage,
          endDrawer: MainDrawerWidget(),
          bottomNavigationBar: BottomAppBar(
            //shape: CircularNotchedRectangle(),
            //notchMargin: 15,
            elevation: 10,
            child: Container(
              height: 60,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(color: const Color(0xFF652981).withOpacity(0.2), blurRadius: 2, offset: const Offset(0, 2)),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 30,
                    onPressed: () {

                      controller.currentIndex.value = 0;
                      Get.lazyPut<HomeController>(
                        () => HomeController(),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          height: 16,
                          width: 16,
                          image: const AssetImage('assets/icons/home.png'),
                          color: controller.currentIndex.value == 0 ? AppColors.primaryColor : Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Home'.tr,
                            style: TextStyle(
                              color: controller.currentIndex.value == 0 ? AppColors.primaryColor : Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // MaterialButton(
                  //   minWidth: 30,
                  //   onPressed: () {
                  //
                  //     controller.currentIndex.value = 1;
                  //   },
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: <Widget>[
                  //       Image(
                  //         height: 16,
                  //         width: 16,
                  //         image: const AssetImage('assets/icons/gift.png'),
                  //         color: controller.currentIndex.value == 1 ? const Color(0xFF652981) : Colors.grey,
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.only(top: 5),
                  //         child: Text(
                  //           'Offer'.tr,
                  //           style: TextStyle(
                  //             color: controller.currentIndex.value == 1 ? const Color(0xFF652981) : Colors.grey,
                  //             fontWeight: FontWeight.normal,
                  //             fontSize: 12,
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),



                  MaterialButton(
                    minWidth: 30,
                    onPressed: () {
                      controller.currentIndex.value = 1;
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          height: 16,
                          width: 16,
                          image: const AssetImage('assets/icons/avatar.png'),
                          color: controller.currentIndex.value == 1 ? AppColors.primaryColor : Colors.grey,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Profile'.tr,
                            style: TextStyle(
                              color: controller.currentIndex.value == 1
                                  ? AppColors.primaryColor: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
