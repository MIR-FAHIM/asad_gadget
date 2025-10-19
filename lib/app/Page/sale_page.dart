import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/app/Page/widget/bottom_tab_bar.dart';


// class SalePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//         length: 2,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text("Title text"),
//           ),
//           bottomNavigationBar: menu(),
//           body: TabBarView(
//             children: [
//               Container(child: Icon(Icons.directions_car)),
//               Container(child: Icon(Icons.directions_transit)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget menu() {
//     return Container(
//       child: TabBar(
//         labelColor: Colors.purple[900],
//         unselectedLabelColor: Colors.grey[600],
//         indicatorSize: TabBarIndicatorSize.tab,
//         indicatorPadding: EdgeInsets.all(5.0),
//         tabs: [
//           Tab(
//             text: "দ্রুত বিক্রি",
//             icon: Icon(Icons.euro_symbol),
//           ),
//           Tab(
//             text: "লিস্ট থেকে বিক্রি",
//             icon: Icon(Icons.assignment),
//           ),
//         ],
//       ),
//     );
//   }
// }

class SalePage extends StatefulWidget {
  const SalePage({Key? key}) : super(key: key);

  @override
  State<SalePage> createState() => _SalePageState();
}

class _SalePageState extends State<SalePage> with TickerProviderStateMixin {
  TabController? tabController;
  int currentTabIndex = 0;
  void onTabChange() {
    setState(() {
      currentTabIndex = tabController!.index;
      print(currentTabIndex);
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    // tabController.addListener(() {
    //   onTabChange();
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _size = Get.size;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(65, 65),
          child: AppBar(
            backgroundColor: Color(0xFF652981),
            centerTitle: true,
            title: Text('Sell'.tr),
            elevation: 0,
            // leading: IconButton(
            //     onPressed: () {
            //       Get.offNamed(Routes.HOME);
            //     },
            //     icon: Icon(
            //       Icons.arrow_back_ios,
            //       color: Colors.white70,
            //     )),
          ),
        ),
        body: Container(
          width: _size.width,
          // margin: EdgeInsets.all(20),

          child: Column(
            children: [
              Container(),
              Expanded(
                child: Container(
                  child: TabBarView(
                    controller: tabController,
                    children: [

                    ],
                  ),
                ),
              ),
              BottomTabBar(tabController: tabController!),
            ],
          ),
        ));
  }
}
