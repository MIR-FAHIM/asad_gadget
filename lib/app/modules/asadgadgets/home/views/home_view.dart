import 'dart:io'; // Required for exit(0)
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/app/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/common/Color.dart'; // Ensure this path is correct
import '../controllers/home_controller.dart';

// Custom Clipper for the curved shape at the bottom of the header
class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    // Start from the bottom-left corner, before the curve begins
    path.lineTo(0, size.height - 30);

    path.quadraticBezierTo(
        size.width / 2, size.height + 30, size.width, size.height - 30);
    // Draw a line to the top-right corner
    path.lineTo(size.width, 0);
    // Close the path to complete the shape (connects back to 0,0)
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class HomeView extends GetView<HomeController> {

  @override
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // Get the size of the screen for responsive layout
    final size = MediaQuery.of(context).size;

    return WillPopScope(
      // Prevents the user from going back using the device's back button
      // and instead exits the application.
      onWillPop: () async {
        return exit(0);
      },
      child: Scaffold(
        // Set the background color of the entire scaffold to match the image
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Curved Top Section (replaces the AppBar)
              ClipPath(
                clipper: ArcClipper(), // Apply the custom clipper for the curve
                child: Container(
                  height: size.height * 0.2, // Adjust height to fit content and curve
                  width: size.width, // Take full width
                  decoration:  BoxDecoration(
                    color: AppColors.primaryColor, // Orange color for the header background
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                      child:  Image.asset('assets/banner_asad.png')
                    ),
                  ),
                ),
              ),
              // Main content area below the curved header
                ClipRRect(
          // ClipRRect is used to clip its child using a rounded rectangle.
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0), // Adjust the radius as needed
            topRight: Radius.circular(30.0), ),// Adjust the radius as needed
          
                child: Container(
                  height: Get.height*.8,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                    child: Column(
                      children: [
                        Text(
                          'Welcome, ${Get.find<AuthService>().currentUser.value.user!.name}',
                          style: TextStyle(
                            color: Colors.black, // White text color
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // Grid of action tiles
                        GridView.count(
                          shrinkWrap: true, // Allows GridView to take only necessary space
                          physics: const NeverScrollableScrollPhysics(), // Prevents GridView from scrolling independently
                          crossAxisCount: 2, // Two columns in the grid
                          crossAxisSpacing: 16, // Horizontal spacing between tiles
                          mainAxisSpacing: 16, // Vertical spacing between tiles
                          children: [
                            // Individual tiles
                            _buildGridItem(
                              icon: Icons.edit_note, // Registration icon
                              label: 'Registration'.tr,
                              onTap: () {
                               Get.toNamed(Routes.REGISTER_TAB);
                              },
                            ),
                            _buildGridItem(
                              icon: Icons.inventory_2_outlined, // Order icon
                              label: 'Order'.tr,
                              onTap: () {
                               Get.toNamed(Routes.ORDERVIEW);
                              },
                            ),
                            _buildGridItem(
                              icon: Icons.refresh, // Replacement icon
                              label: 'Replacement'.tr,
                              onTap: () {
                                // Navigate to replacement page
                              },
                            ),
                            _buildGridItem(
                              icon: Icons.directions_walk, // Visit icon
                              label: 'Visit'.tr,
                              onTap: () {
                              Get.toNamed(Routes.VISIT_LIST);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 16), // Spacing between grid and road map tile
                        // Full-width "Road Map" tile
                        _buildFullWidthItem(
                          icon: Icons.map_outlined, // Road Map icon
                          label: 'Road Map'.tr,
                          onTap: () {
                            Get.toNamed(Routes.ROADMAP);
                          },
                        ),
                      ],
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

  // Helper widget to build a single grid item (card)
  Widget _buildGridItem({required IconData icon, required String label, required VoidCallback onTap}) {
    return Card(
      color: Colors.white,
      elevation: 2, // Subtle shadow for the card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), // Rounded corners
      child: InkWell(
        onTap: onTap, // Tap callback
        borderRadius: BorderRadius.circular(15), // Ensures ripple effect respects rounded corners
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
          children: [
            Icon(
              icon,
              size: 50, // Icon size
              color: AppColors.primaryColor, // Orange icon color
            ),
            const SizedBox(height: 10), // Spacing between icon and text
            Text(
              label,
              style:  TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black, // Black text color
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget to build the full-width "Road Map" item
  Widget _buildFullWidthItem({required IconData icon, required String label, required VoidCallback onTap}) {
    return Card(
      color: Colors.white,
      elevation: 2, // Subtle shadow for the card
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)), // Rounded corners
      child: InkWell(
        onTap: onTap, // Tap callback
        borderRadius: BorderRadius.circular(15), // Ensures ripple effect respects rounded corners
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center content horizontally
            children: [
              Icon(
                icon,
                size: 50, // Icon size
                color: AppColors.primaryColor, // Orange icon color
              ),
              const SizedBox(width: 15), // Spacing between icon and text
              Text(
                label,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black, // Black text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}