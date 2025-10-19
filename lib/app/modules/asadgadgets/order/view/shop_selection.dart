import 'package:asad_gadget/app/modules/asadgadgets/order/controller/order_controller.dart';
import 'package:asad_gadget/app/modules/asadgadgets/products/controller/product_controller.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopListView extends GetView<OrderController> {
  // Using StatelessWidget as GetView requires a Controller type and we're defining it inline for demo

  ShopListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey, // Background for the entire screen
      body: Column(
        children: [
          // Custom Header
          Container(
            padding:
                const EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor, // White background for the header
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
                      'Shops'.tr,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  ],
                ),
                const SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search shops',
                    prefixIcon:
                        const Icon(Icons.search, color: AppColors.greyText),
                    filled: true,
                    fillColor: AppColors.lightGrey, // Light grey for search bar
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              itemCount: controller.shopList.value.length,
              itemBuilder: (context, index) {
                var data = controller.shopList.value[index];
                return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PRODUCTLIST);
                    },
                    child: Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data.name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.black,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    data.address, // Format as Tk 1,800
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text('1.5 km away')
                          ],
                        ),
                      ),
                    ));
              },
            ),
          ),
        ],
      ),
    );
  }
}



// To run this code, you can use it in a main.dart like this:
// void main() {
//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProductListUI(),
//     ),
//   );
// }
