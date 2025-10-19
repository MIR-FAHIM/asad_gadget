import 'package:asad_gadget/app/models/asad_gadget/get_products_model.dart';
import 'package:asad_gadget/app/modules/asadgadgets/order/controller/order_controller.dart';
import 'package:asad_gadget/app/modules/asadgadgets/products/controller/product_controller.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product {
  final String id;
  final String name;
  final double price;
  final int stock;
  final String imageUrl;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.stock,
    required this.imageUrl,
  });
}

class ProductListUI extends GetView<ProductController> {
  // Using StatelessWidget as GetView requires a Controller type and we're defining it inline for demo

  ProductListUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:
            AppColors.lightGrey, // Background for the entire screen
        body: Column(
          children: [
            // Custom Header
            Container(
              padding: const EdgeInsets.only(
                  top: 50, bottom: 16, left: 16, right: 16),
              decoration: BoxDecoration(
                color:
                    AppColors.primaryColor, // White background for the header
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25)), // Rounded corners at bottom
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back,
                            color: AppColors.white), // Dark back icon
                        onPressed: () => Get.back(),
                      ),
                      Text(
                        'Products',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Stack(
                      //   children: [
                      //     IconButton(
                      //       icon: Icon(
                      //         Icons.shopping_cart,
                      //         color: AppColors.white,
                      //       ),
                      //       onPressed: () {
                      //         controller.goToCart();
                      //       },
                      //     ),
                      //     // Only show the badge if there's something in the cart
                      //     if (Get.find<OrderController>().cartItemList.isNotEmpty)
                      //       Positioned(
                      //         right: 4,
                      //         top: 4,
                      //         child: Container(
                      //           padding: EdgeInsets.all(4),
                      //           decoration: BoxDecoration(
                      //             color: Colors.red,
                      //             shape: BoxShape.circle,
                      //           ),
                      //           constraints: BoxConstraints(
                      //             minWidth: 18,
                      //             minHeight: 18,
                      //           ),
                      //           child: Center(
                      //             child: Obx(
                      //                () {
                      //                 return Text(
                      //                   '${Get.find<OrderController>().cartItemList.length}',
                      //                   style: TextStyle(
                      //                     color: Colors.white,
                      //                     fontSize: 12,
                      //                   ),
                      //                   textAlign: TextAlign.center,
                      //                 );
                      //               }
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //   ],
                      // ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    onChanged: (e) {
                      controller.filteredProductController(e);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search products',
                      prefixIcon:
                          const Icon(Icons.search, color: AppColors.greyText),
                      filled: true,
                      fillColor:
                          AppColors.lightGrey, // Light grey for search bar
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 15),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 20.0),
                  itemCount: controller.filterProducts.value.length,
                  itemBuilder: (context, index) {
                    final product = controller.filterProducts.value[index];
                    return ProductCard(
                        product: product, controller: controller);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle View Cart & Proceed
                    controller.goToCart();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor, // Orange button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'View Cart & Proceed',
                    style: TextStyle(
                      color: AppColors.white, // White text
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

class ProductCard extends StatelessWidget {
  final DatumProducts product;
  final ProductController controller;

  const ProductCard(
      {required this.product, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: AppColors.lightGrey, // Background for image
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.productImage,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image,
                        size: 40, color: AppColors.greyText);
                  },
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Tk ${product.productPrice}', // Format as Tk 1,800
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'In stock: ${product.stockCount}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.greyText,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                controller.addToCart(product);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor, // Orange button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
              child: Text(
                'Add to Cart',
                style: TextStyle(
                  color: AppColors.white, // White text
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
