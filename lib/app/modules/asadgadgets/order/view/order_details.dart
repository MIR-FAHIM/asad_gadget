import 'package:asad_gadget/app/modules/asadgadgets/order/controller/order_controller.dart';
import 'package:asad_gadget/app/services/auth_service.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class OrderDetailsView extends GetView<OrderController> {


  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    // You would typically pass order details via Get.arguments or fetch from a controller
    const String orderId = '#ORD-1052';
    const String address = 'Rahim Telecom';
    const String productName = 'Fast Charger';
    const int quantity = 5;
    const double price = 1400.0; // Price for this quantity of product
    const String orderDate = '23 July 225'; // As per the image

    return Scaffold(
      body: Column(
        children: [
          // Custom Header (matching your other designs)
          Container(
            padding:
                const EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
            decoration: BoxDecoration(
              color: AppColors.primaryColor, // Orange background for the header
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25)), // Rounded corners at bottom
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: AppColors.white), // White back icon
                  onPressed: () => Get.back(), // Uses GetX navigation
                ),
                Expanded(
                  child: Text(
                    'View Details',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Placeholder for alignment if no icon on the right
                const SizedBox(width: 48), // Match IconButton width
              ],
            ),
          ),


          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 3,
                color: AppColors.homeCardBg, // White card background
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Order ID

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Order ID:',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.homeTextColor3,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                controller.orderID.value,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColorBlack,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Status:',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.homeTextColor3,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                controller.orderStatus.value,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColorBlack,
                                ),
                              ),
                            ],
                          ),
                         Column(
                            children: [
                              Text(
                                'Total Amount:',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.homeTextColor3,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                controller.orderTotalAmount.value,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.textColorBlack,
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),

                      const SizedBox(height: 10),
                      Get.find<AuthService>().currentUser.value.user!.userType == 'shop'?
                      Container():
                      // Address
                      Text(
                        'Address',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.homeTextColor3,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Get.find<AuthService>().currentUser.value.user!.userType == 'shop'?
                      Container():
                      Text(
                        address,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColorBlack,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Get.find<AuthService>().currentUser.value.user!.userType == 'shop'?
                      Container():
                      // Map Placeholder
                      Container(
                        height: 150, // Fixed height for the map
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://media.wired.com/photos/59269cd37034dc5f91bec0f1/191:100/w_1280,c_limit/GoogleMapTA.jpg?mbid=social_retweet', // A generic map thumbnail
                            fit: BoxFit.contain,
                            width: double.infinity,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Text(
                                  'Map Not Available',
                                  style: TextStyle(
                                      color: AppColors.homeTextColor3),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Product Details Table Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Product',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColorBlack,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Quantity',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColorBlack,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Price',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textColorBlack,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.black, height: 10),

                      // Product Details Row (You can loop this for multiple products)

                      Container(
                        height:   Get.find<AuthService>().currentUser.value.user!.userType == 'shop'?
                        Get.height*.4: Get.height*.25,
                        child: ListView.builder(
                          itemCount: controller.cartItemList.value.length,
                          itemBuilder: (context, index){
                            var data = controller.cartItemList.value[index];
                          return  Column(
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        data.productName,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.textColorBlack,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        data.quantity.toString(),
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.textColorBlack,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        '৳${data.cartPrice}', // Format with ৳
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: AppColors.textColorBlack,
                                        ),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              Container(
                                height: .5,
                                width: Get.width*.9,
                                color: Colors.orange,
                              )
                            ],
                          );
                          },
                        ),
                      ),

                      // Add more product rows here if needed
                      // Divider(color: AppColors.dividerColor, height: 20),
                      // Another Row for next product...

                      const SizedBox(height: 40),

                      // Mark as Delivered Button

                      Get.find<AuthService>().currentUser.value.user!.userType == 'shop'?
                          Container():
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            controller.markDeliver(controller.orderID.value);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                AppColors.primaryColor, // Orange button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            'Mark as Delivered',
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Date at the bottom
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          DateFormat('dd MMM yyyy').format(
                            DateTime.parse(controller.orderDate.value),
                          ),

                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.homeTextColor3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// To run this code, you can use it in a main.dart like this:
/*
void main() {
  runApp(
    GetMaterialApp( // Use GetMaterialApp for GetX features like Get.back()
      debugShowCheckedModeBanner: false,
      home: OrderDetailsView(),
    ),
  );
}
*/
