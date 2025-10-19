import 'package:asad_gadget/app/models/asad_gadget/cart_item_model.dart';
import 'package:asad_gadget/app/modules/asadgadgets/order/controller/order_controller.dart';
import 'package:asad_gadget/app/modules/global_widgets/block_button_widget.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

// Represents a single item in the order summary table
class OrderItem {
  final String product;
  final String model;
  final int quantity;
  final double price; // Price per unit
  final double total; // Quantity * Price

  OrderItem({
    required this.product,
    required this.model,
    required this.quantity,
    required this.price,
    required this.total,
  });
}

class NewOrder extends GetView<OrderController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor:
          AppColors.white, // Use light mode background for this page
      body: Obx(() {
        return Column(
          children: [
            // Curved Top Section (App Bar replacement)
            ClipPath(
              clipper: ArcClipper(),
              child: Container(
                height:
                    size.height * 0.18, // Adjusted height for better spacing
                width: size.width,
                decoration: BoxDecoration(
                  color: AppColors
                      .primaryColor, // Use primary color (orange) for the app bar
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
                                'Summary'.tr,
                                style: TextStyle(
                                  color: AppColors.white, // White text
                                  fontSize: 16,
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
            // Main content area
            Expanded(
              child: SingleChildScrollView(
                padding:  EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() => _buildOrderSummaryTable(controller.cartItemList.value)),
                    const SizedBox(height: 20),

                    // Total Amount
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColorBlack,
                          ),
                        ),
                        Obx(() => Text(
                              '৳${controller.totalAmount.value.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColorBlack,
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Notes Input
                    Text(
                      'Notes',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColorBlack,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: controller.notesController.value,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Add any special instructions...',
                        hintStyle: TextStyle(color: AppColors.homeTextColor3),
                        filled: true,
                        fillColor: AppColors.homeCardBg,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 12),
                      ),
                      style: TextStyle(color: AppColors.textColorBlack),
                    ),
                    const SizedBox(height: 20),

                    // Optional Attachment
                    Row(
                      children: [
                        Icon(Icons.attach_file,
                            color: AppColors.textColorBlack),
                        const SizedBox(width: 8),
                        Text(
                          'Optional Attachment',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textColorBlack,
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline,
                              color: AppColors.primaryColor),
                          onPressed: () {
                            // Implement attachment logic
                            print('Add attachment');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Submit Order Button
                    BlockButtonWidget(
                      onPressed: () => controller.submitOrder(),
                      color: AppColors.primaryColor, // Orange button
                      text: Text(
                        "Submit Order".tr,
                        style: Get.textTheme.bodyMedium!.merge(
                          TextStyle(color: AppColors.white), // White text
                        ),
                      ),
                    ).paddingSymmetric(
                        horizontal:
                            0), // No horizontal padding for BlockButtonWidget
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }

  // Helper widget to build the order summary table
  Widget _buildOrderSummaryTable(List <Item> items) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.homeCardBg, // Light card background for the table
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.dividerColor), // Subtle border
      ),
      child: Column(
        children: [
          // Table Header
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Row(
              children: [
                _buildTableHeaderCell('Product', flex: 3),
                _buildTableHeaderCell('Model', flex: 2),
                _buildTableHeaderCell('Qty', flex: 1),
                _buildTableHeaderCell('Price', flex: 2),
                _buildTableHeaderCell('Total', flex: 2),
              ],
            ),
          ),
          Divider(height: 1, color: AppColors.dividerColor),

          // Table Rows
          if (items.isEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'No items added to order yet.',
                style: TextStyle(color: AppColors.homeTextColor3),
              ),
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics:
                  const NeverScrollableScrollPhysics(), // Prevent inner scrolling
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 8.0),
                      child: Row(
                        children: [
                          _buildTableCell(item.productName, flex: 3),
                          _buildTableCell('model423', flex: 2),
                          _buildTableCell(item.quantity.toString(), flex: 1),
                          _buildTableCell('৳${item.productPrice.toString()}',
                              flex: 2),
                          _buildTableCell('৳${item.cartPrice.toString()}',
                              flex: 2),
                        ],
                      ),
                    ),
                    if (index < items.length - 1)
                      Divider(height: 1, color: AppColors.dividerColor),
                  ],
                );
              },
            ),
        ],
      ),
    );
  }

  Widget _buildTableHeaderCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: AppColors.textColorBlack,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildTableCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: AppColors.textColorBlack,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
