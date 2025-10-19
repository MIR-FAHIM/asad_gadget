
import 'package:asad_gadget/app/modules/shop_register/controller/shop_register_controller.dart';
import 'package:asad_gadget/app/modules/shop_register/view/shop_list_by_dsr.dart';
import 'package:asad_gadget/app/modules/shop_register/view/shop_register_by_dsr/shop_register_by_dsr.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class RegisterTabView extends GetView<ShopRegisterController> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        backgroundColor:AppColors
            .white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor:AppColors
              .backgroundColor,
          title: Text('Register'),
        ),
        body: Column(
          children: [
            // Tabs with counts
            TabBar(
              isScrollable: true,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.blueAccent,
              tabs: [
                Tab(text: 'Register'), // "General" = All
                Tab(text: 'Previous'),
        
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: TabBarView(
                children: [
                  ShopRegisterByDsr(),
                  ShopListByDsr(),
        
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}