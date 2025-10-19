
import 'package:asad_gadget/app/modules/shop_register/controller/shop_register_controller.dart';
import 'package:asad_gadget/app/modules/shop_register/view/shop_register_by_dsr/shop_register_by_dsr.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ShopListByDsr extends GetView<ShopRegisterController> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:AppColors
          .white,
    
      body:Container(
        height: Get.height*.8,
        child: ListView.builder(
          itemCount: controller.shopListByDSR.value.length,
            itemBuilder: (context, index){
          var  data = controller.shopListByDSR.value[index];
            return Card(
              child: ListTile(
                title: Text(data.name!),
                subtitle: Text(data.address!),
              ),
            );
            }),
      )
    );

  }
}