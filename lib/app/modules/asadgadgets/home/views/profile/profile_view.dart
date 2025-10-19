import 'package:asad_gadget/app/modules/asadgadgets/home/controllers/home_controller.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/app/services/auth_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:asad_gadget/common/Color.dart'; // Assuming this defines AppColors

import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';

class ProfileView extends GetView<HomeController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.primaryColor, // Dominant orange color for the background
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(80), // Increased height for app bar content
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              // Using a consistent orange color based on the image
              colors: [AppColors.primaryColor, AppColors.primaryColor],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 16.0, right: 16.0),
            child: Container(
              height:
                  Get.height * 0.5, // Adjust height to fit content and curve
              width: Get.width, // Take full width
              decoration: BoxDecoration(
                color: AppColors
                    .primaryColor, // Orange color for the header background
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 20.0),
                  child: Image.asset('assets/banner_asad.png')),
            ),
          ),
        ),
      ),
      body: PopScope(
        // Changed from WillPopScope to PopScope
        canPop: false, // Allows the page to be popped
        onPopInvoked: (bool didPop) {
          // Corrected from onPopInvokedWithResult to onPopInvoked
          if (didPop) {
            Get.toNamed(
                Routes.ROOT); // Navigate to ROOT if the pop was successful
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              // No SizedBox here to remove the gap at the top of the white container
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProfileHeader(),
                      const SizedBox(height: 20),
                      _buildProfileOption(
                        icon: Icons.person_outline,
                        title: 'Edit Profile',
                        onTap: () {
                          print('Edit Profile tapped');
                          // Navigate to edit profile page
                        },
                      ),
                      _buildProfileOption(
                        icon: Icons.lock_outline,
                        title: 'Change Password',
                        onTap: () {
                          print('Change Password tapped');
                          // Navigate to change password page
                        },
                      ),
                      _buildProfileOption(
                        icon: Icons.settings_outlined,
                        title: 'Settings',
                        onTap: () {
                          print('Settings tapped');
                          // Navigate to settings page
                        },
                      ),
                      _buildProfileOption(
                        icon: Icons.help_outline,
                        title: 'Help & Support',
                        onTap: () {
                          print('Help & Support tapped');
                          // Navigate to help & support page
                        },
                      ),
                      _buildProfileOption(
                        icon: Icons.security_outlined,
                        title: 'Privacy Policy',
                        onTap: () {
                          print('Privacy Policy tapped');
                          // Navigate to privacy policy page
                        },
                      ),
                      const SizedBox(height: 30),
                      _buildLogoutButton(),
                      const SizedBox(height: 20), // Add some bottom padding
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build the profile header (user info)
  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: CachedNetworkImageProvider(
            'https://placehold.co/120x120/orange/white?text=User', // Larger placeholder for user image
          ),
        ),
        const SizedBox(height: 15),
        Text(
          Get.find<AuthService>()
              .currentUser
              .value
              .user!
              .name, // Placeholder user name
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          Get.find<AuthService>()
              .currentUser
              .value
              .user!
              .email, // Placeholder user email
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          Get.find<AuthService>()
              .currentUser
              .value
              .user!
              .phone, // Placeholder user phone
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  // Helper method for individual profile options (ListTile-like)
  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: AppColors.primaryColor),
          title: Text(
            title.tr,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing:
              const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
          onTap: onTap,
        ),
        const Divider(
            height: 1, indent: 20, endIndent: 20), // Divider between options
      ],
    );
  }

  // Helper method to build the logout button
  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Implement logout logic here
          print('Logout button tapped');
          Get.find<AuthService>().removeCurrentUser();
          Get.toNamed(Routes.SPLASHSCREEN);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red, // Red color for logout button
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          'Logout'.tr,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // The showPopup function from your original code (kept as is)
  showPopup(context, String type) {
    return showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            content: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Get.theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: Text('Gallary'.tr),
                    onTap: () {
                      //  controller.getImage(ImageSource.gallery, type, "2");
                      Get.back();
                    },
                  ),
                ],
              ),
            ));
      },
    );
  }
}
