import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/common/Color.dart';
import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Root View'),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Obx(() {
        if (controller.currentIndex.value == 0) {
          return _buildHomeTab();
        } else {
          return _buildProfileTab();
        }
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          selectedItemColor: AppColors.primaryColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeTab() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'GetX Architecture Reference',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Architecture Rule: Module Repository returns raw decoded response from APIManager -> Controller receives decoded response, converts to Model, and saves state.',
            style: TextStyle(color: Colors.black54),
          ),
          const Divider(height: 32),
          const Text(
            'Loaded Models in Controller:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          ...controller.sampleItems.map(
            (item) => Card(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primaryColor,
                  child: Text(
                    '${item.id}',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(item.description),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildProfileTab() {
    return const Center(
      child: Text(
        'Profile Tab',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
    );
  }
}
