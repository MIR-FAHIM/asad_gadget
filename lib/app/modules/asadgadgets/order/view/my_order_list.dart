import 'package:asad_gadget/app/models/asad_gadget/get_order_model.dart';
import 'package:asad_gadget/app/modules/asadgadgets/order/controller/order_controller.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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

class MyOrderList extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.white, // Light background for the page
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(size.height * 0.18), // Match ArcClipper height
        child: ClipPath(
          clipper: ArcClipper(),
          child: Container(
            height: size.height * 0.18,
            width: size.width,
            decoration: BoxDecoration(
              color: AppColors.primaryColor, // Orange color for the app bar
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back,
                              color: AppColors.white), // White back icon
                          onPressed: () => Get.back(),
                        ),
                        Expanded(
                          child: Text(
                            'My Orders', // Title for the order list page
                            style: TextStyle(
                              color: AppColors.white, // White text
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        // Placeholder for alignment, adjust if you have a right-side icon
                        const SizedBox(
                            width: 48), // Width of IconButton + padding
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
            ),
          );
        } else if (controller.orderList.value.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.inbox_outlined,
                    size: 80, color: AppColors.homeTextColor3),
                const SizedBox(height: 20),
                Text(
                  'No orders found.',
                  style:
                      TextStyle(fontSize: 18, color: AppColors.homeTextColor3),
                ),
                // const SizedBox(height: 20),
                // ElevatedButton.icon(
                //   onPressed: () => Get.toNamed(
                //       Routes.NEWORDER), // Navigate to create new order
                //   icon: Icon(Icons.add_circle_outline,
                //       color: AppColors.homeTextColor1),
                //   label: Text(
                //     'Create New Order',
                //     style: TextStyle(color: AppColors.homeTextColor1),
                //   ),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: AppColors.primaryColor,
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 20, vertical: 12),
                //   ),
                // ),
              ],
            ),
          );
        } else {
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: controller.orderList.value.length,
            itemBuilder: (context, index) {
              final order = controller.orderList.value[index];
              return _buildOrderItemCard(order, context);
            },
          );
        }
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            Get.toNamed(Routes.PRODUCTLIST), // Navigate to create new order
        label: Text('New Order', style: TextStyle(color: AppColors.white)),
        icon: Icon(Icons.add, color: AppColors.white),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // Helper widget to build an individual order item card
  Widget _buildOrderItemCard(OrderData order, BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      color: AppColors.SectionCardBg, // Light card background
      elevation: 3, // Subtle shadow
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        onTap: () {
          // Handle tap: e.g., navigate to order details page
          print('Tapped on order: ${order.id}');
          controller.orderID.value = order.id.toString();
          controller.orderStatus.value = order.status.toString();
          controller.orderTotalAmount.value = order.totalAmount.toString();
          controller.orderDate.value = order.createdAt.toString();
          controller.getCartItemByOrder(order.cartId);
        },
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order ID: ${order.id}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColorBlack,
                    ),
                  ),
                  Chip(
                    label: Text(
                      order.status,
                      style: TextStyle(
                        color: AppColors.homeTextColor1, // White text on chip
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                'Customer: ${order.userId}',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.homeTextColor2, // Slightly dimmed text
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date: ${DateFormat('dd MMM yyyy').format(order.createdAt)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.homeTextColor2,
                    ),
                  ),
                  Text(
                    'Total: ৳${order.totalAmount}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor, // Orange for total amount
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
