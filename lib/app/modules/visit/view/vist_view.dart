import 'package:asad_gadget/app/modules/visit/controller/visit_controller.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VisitView extends GetView<VisitController> {
  const VisitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Obx(
            () {
          return CustomScrollView(
            slivers: [
              // Custom Header (SliverAppBar for a dynamic header)
              SliverAppBar(
                backgroundColor: AppColors.primaryColor,
                expandedHeight: 120,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/banner_asad.png',
                          height: 60,
                          fit: BoxFit.contain,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.more_vert,
                            color: AppColors.white,
                            size: 30,
                          ),
                          onPressed: () {
                            Get.snackbar('More Options', 'Tapped more icon');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Main content area with a professional-looking card
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Date Selector
                        _buildDateSelector(),
                        const SizedBox(height: 20),

                        // Visits Section Title
                        Text(
                          '${DateFormat('EEEE').format(controller.selectedDate.value)}\'s Visits',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColorBlack,
                          ),
                        ),
                        const SizedBox(height: 20),

                        // List of Stop Items
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // Widget to build the horizontal date selector
  Widget _buildDateSelector() {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7, // Show 7 days (or any number you prefer)
        itemBuilder: (context, index) {
          final date = DateTime.now().subtract(Duration(days: 6 - index));
          final isSelected = controller.selectedDate.value == date.day;
          return GestureDetector(
            onTap: () {
              controller.selectDate(date);
            },
            child: Obx(() {
              final isSelected = controller.selectedDate.value.day == date.day && controller.selectedDate.value.month == date.month;
              return Container(
                width: 60,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryColor : AppColors.homeCardBg,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? AppColors.primaryColor : AppColors.homeTextColor3,
                    width: 1,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('EEE').format(date), // E.g., 'Mon'
                      style: TextStyle(
                        color: isSelected ? AppColors.white : AppColors.textColorBlack,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      DateFormat('dd').format(date), // E.g., '14'
                      style: TextStyle(
                        color: isSelected ? AppColors.white : AppColors.textColorBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
        },
      ),
    );
  }

  // Refined widget to build each stop item with a modern card design
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