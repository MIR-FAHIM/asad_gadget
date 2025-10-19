import 'package:asad_gadget/app/modules/asadgadgets/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/app/models/icon_model.dart';
import 'package:asad_gadget/app/modules/global_widgets/square_card_widget.dart';


class HomeTopOptionWidget extends GetWidget<HomeController> {
  final _size = Get.size;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        height: _size.width * .65,
        width: _size.width,
        color: Colors.white,
        child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            primary: false,
            shrinkWrap: true,
            crossAxisCount: 3,
            crossAxisSpacing: 1,
            mainAxisSpacing: 20.0,
            childAspectRatio: 1.3,
            children: List.generate(iconButtonData.length, (index) {
              return InkWell(
                onTap: iconButtonData[index].press,
                child: AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 475),
                  columnCount: 3,
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: SquareCardWidget(
                        width: 35,
                        aspectRetio: 1.2,
                        image: iconButtonData[index].image,
                        allpadding: 0.0,
                        name: iconButtonData[index].title!.tr,
                      ),
                    ),
                  ),
                ),
              );
            })));
  }
}
