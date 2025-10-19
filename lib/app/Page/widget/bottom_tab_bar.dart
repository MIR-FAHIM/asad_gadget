import 'package:flutter/material.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,

        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 43, 42, 43).withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(0, -2)),
        ],
        //  border: border ?? Border.all(color: Get.theme.focusColor.withOpacity(0.05)),
      ),
      // margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      height: 72,
      child: TabBar(
        controller: tabController,

        labelColor: Colors.purple[900],
        unselectedLabelColor: Colors.grey[600],
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorPadding: EdgeInsets.all(5.0),
        // indicatorColor: AppColors.primaryColor,
        indicator: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
        // unselectedLabelColor: Colors.black,
        // labelColor: Color(0xffF15C22),
        tabs: [
          Tab(
            text: "দ্রুত বিক্রি",
            icon: Icon(Icons.shopping_cart),
          ),
          Tab(
            text: "লিস্ট থেকে বিক্রি",
            icon: Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
    );
  }
}
