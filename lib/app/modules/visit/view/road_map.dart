import 'package:asad_gadget/app/modules/asadgadgets/order/controller/order_controller.dart';
import 'package:asad_gadget/app/modules/visit/controller/visit_controller.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoadMapView extends GetView<VisitController> {
  const RoadMapView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor, // Overall background is orange
      body: Obx(
     () {
          return Column(
            children: [
              // Custom Header (ASAD logo and more icon)
              Container(
                padding:
                    const EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          'assets/banner_asad.png', // Ensure this asset exists
                          height: 60,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // More icon
                    IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: AppColors.white,
                        size: 30,
                      ),
                      onPressed: () {
                        // Handle more options
                        Get.snackbar('More Options', 'Tapped more icon');
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white, // Top part of the main white card
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(25)),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(20.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        elevation: 0, // Card itself has no elevation as per image
                        color: AppColors.homeCardBg, // White card background
                        margin: EdgeInsets.zero, // Remove default card margin
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Road Map'.tr,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textColorBlack,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor.withOpacity(
                                          0.1), // Light orange background
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Text(
                                      'Today',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color:
                                            AppColors.primaryColor, // Orange text
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),

                              // Map Placeholder
                              Container(
                                height: 180, // Height adjusted to match image
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // border: Border.all(color: AppColors.dividerColor), // No border in image
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    'https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg?mbid=social_retweet', // A map image that looks like the one in the UI
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.map,
                                                size: 50,
                                                color: AppColors.homeTextColor3),
                                            Text(
                                              'Map Preview',
                                              style: TextStyle(
                                                  color: AppColors.homeTextColor3),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),

                              Text(
                                'Next Stop',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColorBlack,
                                ),
                              ),
                              const SizedBox(height: 15),

                              controller.filteredVisitList.isEmpty
                                  ? Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Center(
                                  child: Text(
                                    'No visits for this day.',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: AppColors.homeTextColor3,
                                    ),
                                  ),
                                ),
                              )
                                  : ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: controller.filteredVisitList.length,
                                itemBuilder: (context, index) {
                                  final data = controller.filteredVisitList[index];
                                  final isVisited = data.status == 'Visited';
                                  return _buildStopItem(
                                    context,
                                    data.shop.name,
                                    data.shop.address,
                                    data.status,
                                    isVisited,
                                    double.parse(data.latitude!),
                                    double.parse(data.longitude!),
                                  );
                                },
                              ),
                              const SizedBox(height: 30),

                              // Start Day Button
                              SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                  onPressed: () {
                                    // Implement start day logic
                                    Get.snackbar(
                                      'Day Started',
                                      'Your day has begun!',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: AppColors.greenTextColor,
                                      colorText: AppColors.white,
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        AppColors.primaryColor, // Orange button
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: Text(
                                    'Start Day',
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
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }

  Widget _buildStopItem(
      BuildContext context,
      String shopName,
      String location,
      String statusOrDistance,
      bool isVisited,
      double lat,
      double lon,
      ) {
    return InkWell(
      onTap: (){
        Get.toNamed(Routes.VISIT_MAP, arguments: [lat, lon]);
      },
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                isVisited ? Icons.check_circle : Icons.location_on,
                color: isVisited ? AppColors.greenTextColor : AppColors.primaryColor,
                size: 28,
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shop Name: $shopName',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColorBlack,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.homeTextColor3,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                statusOrDistance,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isVisited ? FontWeight.bold : FontWeight.normal,
                  color: isVisited ? AppColors.greenTextColor : AppColors.textColorBlack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
