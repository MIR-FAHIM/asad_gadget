import 'package:asad_gadget/app/models/asad_gadget/cart_item_model.dart';
import 'package:asad_gadget/app/modules/asadgadgets/order/controller/order_controller.dart';
import 'package:asad_gadget/app/modules/asadgadgets/products/controller/product_controller.dart';
import 'package:asad_gadget/app/modules/global_widgets/block_button_widget.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// For navigation

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

class CartView extends GetView<OrderController> {
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
                                'Cart Items Added: ${controller.cartItemList.value.length.toString()}',
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: Get.height * .7,
                      child: ListView.builder(
                          itemCount: controller.cartItemList.value.length,
                          itemBuilder: (context, index) {
                            var data = controller.cartItemList.value[index];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Product Image
                                    Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        color: AppColors
                                            .homeCardBg, // Light grey background
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          'https://thumbs.dreamstime.com/b/product-icon-symbol-creative-sign-quality-control-icons-collection-filled-flat-computer-mobile-illustration-logo-150923733.jpg',
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Icon(Icons.broken_image,
                                                size: 40,
                                                color:
                                                    AppColors.homeTextColor3);
                                          },
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 16.0),

                                    // Product Details (Name, Model, Price)
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.productName,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.textColorBlack,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 4.0),
                                          Text(
                                            'Model: 342dsf',
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: AppColors.homeTextColor3,
                                            ),
                                          ),
                                          const SizedBox(height: 4.0),
                                          Text(
                                            '৳${data.productPrice} / unit',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.textColorBlack,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                        width:
                                            10.0), // Space before quantity controls

                                    // Quantity Controls and Item Total
                                    Column(
                                      children: [
                                        // Quantity buttons
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0, vertical: 2.0),
                                          decoration: BoxDecoration(
                                            color: AppColors
                                                .homeCardBg, // Light background for the quantity box
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: AppColors.dividerColor),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize
                                                .min, // Make row shrink to fit children
                                            children: [
                                              // These would typically trigger methods in a controller
                                              GestureDetector(
                                                onTap: () {
                                                  int quantity = data.quantity;
                                                  if (quantity > 0) {
                                                    quantity--;
                                                    controller.cartUpdate(
                                                        data.id,
                                                        quantity,
                                                        (quantity *
                                                                double.parse(data
                                                                    .productPrice))
                                                            .toStringAsFixed(
                                                                2));
                                                  }

                                                  // Decrease quantity logic here (e.g., controller.decreaseQuantity(item))
                                                },
                                                child: Icon(Icons.remove,
                                                    size: 20,
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: Text(
                                                  data.quantity
                                                      .toString(), // This would be dynamic (e.g., item.quantity.value.toString())
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: AppColors
                                                        .textColorBlack,
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  int quantity = data.quantity;
                                                  quantity++;
                                                  controller.cartUpdate(
                                                      data.id,
                                                      quantity,
                                                      (quantity *
                                                              double.parse(data
                                                                  .productPrice))
                                                          .toStringAsFixed(2));
                                                },
                                                child: Icon(Icons.add,
                                                    size: 20,
                                                    color:
                                                        AppColors.primaryColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 8.0),
                                        // Item Total
                                        Text(
                                          '৳ ${(data.quantity * double.parse(data.productPrice)).toStringAsFixed(2)}', // Calculate total
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors
                                                .primaryColor, // Highlight total price
                                          ),
                                        ),
                                        Text('Is Return?'),
                                      ],
                                    ),
                                    const SizedBox(width: 10.0),

                                    // Delete Button
                                    Align(
                                      alignment: Alignment
                                          .bottomCenter, // Align with the top of the row
                                      child: Column(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.delete_outline,
                                                color: Colors.red, size: 24),
                                            onPressed: () {
                                              controller
                                                  .deleteCartItem(data.id);
                                            },
                                            visualDensity: VisualDensity
                                                .compact, // Reduce padding
                                            padding: EdgeInsets
                                                .zero, // Remove all padding
                                            constraints:
                                                const BoxConstraints(), // Remove default minimum size constraints
                                          ),
                                          Checkbox(
                                              value: false, onChanged: (e) {})
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),

                    const SizedBox(height: 30),

                    BlockButtonWidget(
                      onPressed: () {
                        Get.toNamed(Routes.NEWORDER);
                      },
                      color: AppColors.primaryColor, // Orange button
                      text: Text(
                        "View Summary".tr,
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
