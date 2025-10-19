import 'package:asad_gadget/app/modules/asadgadgets/order/controller/order_controller.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/common/Color.dart'; // Ensure this path is correct

// Custom Clipper for the curved shape at the bottom of the header
class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 2, size.height + 30, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class OrderView extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white, // Background color from the image
      body: Column(
        children: [
          // Curved Top Section (App Bar replacement)
          ClipPath(
            clipper: ArcClipper(),
            child: Container(
              height: size.height * 0.15, // Adjust height as needed
              width: size.width,
              decoration: BoxDecoration(
                color: AppColors.primaryColor, // Orange color for the app bar
              ),
              child: SafeArea(
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back,
                              color: AppColors.white), // Dark back icon
                          onPressed: () => Get.back(),
                        ),
                        SizedBox(width: Get.width * .13),
                        Image.asset('assets/banner_asad.png')
                      ],
                    )),
              ),
            ),
          ),
          // Main content with curved top corners
          SizedBox(
            height: Get.height * .3,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.primaryColor, // Orange button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 0, // No shadow for a flat look
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.SHOP_LIST);
                      },
                      child: controller.isLoading.value
                          ? CircularProgressIndicator(color: AppColors.white)
                          : Text(
                              'New Order'.tr,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppColors.primaryColor, // Orange button
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 0, // No shadow for a flat look
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.MYORDER);
                      },
                      child: controller.isLoading.value
                          ? CircularProgressIndicator(color: AppColors.white)
                          : Text(
                              'My Order'.tr,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
