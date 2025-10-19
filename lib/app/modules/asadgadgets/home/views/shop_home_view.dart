import 'package:asad_gadget/app/modules/asadgadgets/home/controllers/home_controller.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/app/services/auth_service.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopDashboardPage extends GetView<HomeController> {
  const ShopDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor, // Dominant orange color
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildAppBar(context),
              _buildMainContent(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color:
              AppColors.primaryColor, // Orange color for the header background
        ),
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Image.asset(
              'assets/banner_asad.png',
              height: Get.height * .05,
              width: Get.width * .3,
            )),
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildShopInfoCard(),
            const SizedBox(height: 10),
            _buildSpecialSaleBanner(),
            const SizedBox(height: 10),
            _buildDashboardGrid(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildShopInfoCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Get.find<AuthService>().currentUser.value.user!.name,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Get.find<AuthService>().currentUser.value.user == null
                        ? Text(
                            'No Data',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          )
                        : Text(
                            Get.find<AuthService>()
                                    .currentUser
                                    .value
                                    .user!
                                    .address ??
                                'No Address',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                    Text(
                      Get.find<AuthService>().currentUser.value.user!.phone ??
                          'No Phone',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                      'https://placehold.co/100x100/orange/white?text=Shop'), // Placeholder for shop owner image
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "This Month's Purchase",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  '75,000',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF7A00),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpecialSaleBanner() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'SPECIAL SALE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'UP TO 30% OFF',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Image.network(
            'https://static.vecteezy.com/system/resources/previews/042/399/243/non_2x/placeholder-image-default-set-for-the-website-free-vector.jpg', // Placeholder for laptop image
            width: Get.width * .45,
            height: Get.height * .1,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget _buildDashboardGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Disable scrolling for GridView
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      childAspectRatio: 1.2, // Adjust aspect ratio for better button size
      children: [
        _buildGridButton(
          icon: Icons.shopping_bag_outlined,
          text: 'Place New Order',
          onTap: () {
            Get.toNamed(Routes.PRODUCTLIST);
          },
        ),
        _buildGridButton(
          icon: Icons.list_alt,
          text: 'My Orders',
          onTap: () {
            // Handle My Orders tap
            Get.toNamed(Routes.MYORDER);
          },
        ),
        _buildGridButton(
          icon: Icons.payment,
          text: 'Due Payments',
          onTap: () {
            // Handle Due Payments tap
            print('Due Payments tapped');
          },
        ),
        _buildGridButton(
          icon: Icons.cached,
          text: 'Replacement',
          onTap: () {
            // Handle Replacement tap
            print('Replacement tapped');
          },
        ),
      ],
    );
  }

  Widget _buildGridButton({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: const Color(0xFFFF7A00),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
