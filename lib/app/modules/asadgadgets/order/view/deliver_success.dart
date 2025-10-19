import 'package:asad_gadget/app/modules/asadgadgets/order/controller/order_controller.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliverSuccessView extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white, // Light background for the page
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Success Icon
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors
                      .greenTextColor, // Green background for the checkmark
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check,
                  color: AppColors.white, // White checkmark
                  size: 40,
                ),
              ),
              const SizedBox(height: 30),

              // Success Message
              Text(
                'Deliver Successful!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColorBlack, // Black text
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              // Order Summary Card
              Card(
                color: AppColors.homeCardBg, // Light card background
                elevation: 5, // Subtle shadow
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Order Summary',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColorBlack,
                        ),
                      ),
                      const Divider(height: 30),
                      _buildSummaryRow('Order ID', '#ORD-1247'),
                      _buildSummaryRow('Total Products', '4 Items'),
                      _buildSummaryRow('Total Amount', '৳2,350'),
                      _buildSummaryRow('Customer', 'Rahim Telecom'),
                      _buildSummaryRow('Order Date', '23 July 2025'),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Share and Download Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Implement share logic
                        print('Share Order Summary');
                      },
                      icon: Icon(Icons.share,
                          color: AppColors.primaryColor), // Orange icon
                      label: Text(
                        'Share Order Summary',
                        style: TextStyle(
                            color: AppColors.primaryColor), // Orange text
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: AppColors.primaryColor), // Orange border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: () {
                        // Implement download logic
                        print('Download Invoice');
                      },
                      icon: Icon(Icons.download,
                          color: AppColors.primaryColor), // Orange icon
                      label: Text(
                        'Download Invoice',
                        style: TextStyle(
                            color: AppColors.primaryColor), // Orange text
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: AppColors.primaryColor), // Orange border
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Action Buttons
              SizedBox(
                width: double.infinity, // Full width button
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to place another order (e.g., back to NewOrder page)
                    Get.offNamed(Routes
                        .NEWORDER); // Use offNamed to clear previous route
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.lightGrey, // Orange button
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Place Another Order',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.homeTextColor1, // White text
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity, // Full width button
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to view all orders
                    Get.offNamed(
                        Routes.MYORDER); // Use offNamed to clear previous route
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor, // Orange button
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'View My Orders',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppColors.white, // White text
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.homeTextColor2, // Slightly dimmed text
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textColorBlack,
            ),
          ),
        ],
      ),
    );
  }
}
