import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:asad_gadget/common/Color.dart';

import '../controllers/current_due_controller.dart';

class CurrentDueView extends GetView<CurrentDueController> {
  const CurrentDueView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF652981),
        title: const Text('Current Due'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: Get.size.width,
              color: AppColors.homeCardBg,
              child: Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 10, bottom: 10, right: 10),

                            /// Image item
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        const BorderRadius.all(Radius.circular(15.0)),
                                    image: const DecorationImage(
                                        image: AssetImage('assets/collection/1.png')),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12.withOpacity(0.1),
                                          blurRadius: 0.5,
                                          spreadRadius: 0.1)
                                    ]),
                                child: Container(
                                  height: 40.0,
                                  width: 40.0,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                    image: DecorationImage(
                                        image: AssetImage('assets/collection/1.png')),
                                  ),
                                ))),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                          child: Column(
                            /// Text Information Item
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: const Text(
                                  'মো. আবদুল',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Sans",
                                      color: Colors.black87,
                                      fontSize: 14.0),
                                  overflow: TextOverflow.clip,
                                ),
                              ),
                              const Text(
                                '+৮৮০১৪০০০০০০০০',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontFamily: "Sofia",
                                    color: Colors.black,
                                    fontSize: 12),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25, right: 15),
                      child: Image.asset(
                        "assets/icons/right_arrow.png",
                        width: 15,
                        height: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: List.generate(3, (index) {
                return ExpansionTile(
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  expandedAlignment: Alignment.bottomLeft,
                  title: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Container(
                      width: Get.size.width,
                      color: AppColors.homeCardBg,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5.0, left: 15.0, right: 5.0),
                              child: Column(
                                /// Text Information Item
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: const Text(
                                      'Invoice No:1234567',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Sans",
                                          color: Colors.black87,
                                          fontSize: 14.0),
                                      overflow: TextOverflow.clip,
                                    ),
                                  ),
                                  const Text(
                                    '9th may 2022',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: "Sofia",
                                        color: Colors.black,
                                        fontSize: 12),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 25, right: 15),
                              child: Text(
                                'BDT 700',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Sans",
                                    color: Colors.black87,
                                    fontSize: 14.0),
                                overflow: TextOverflow.clip,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Previous Due List',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        Column(
                          children: List.generate(2, (index) {
                            return Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 40,
                                          color: Get.theme.primaryColor,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text('Product name'),
                                            Text('700 X 1'),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Text('BDT 700'),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            height: 2,
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'BDT 0.0',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Discount',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'BDT 0.0',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Grant Total',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                'BDT 0.0',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: Get.size.width * .25,
        width: Get.size.width,
        decoration: const BoxDecoration(
          color: Colors.white24,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                            border: Border.all(
                          width: 2,
                          color: Get.theme.primaryColor,
                        )),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Want to send sms?',
                        style: TextStyle(color: Get.theme.primaryColor, fontSize: 16),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      'Will deduct .25 taka for sms',
                      style: TextStyle(color: Get.theme.primaryColor, fontSize: 11),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Payment date',
                    style: TextStyle(color: Get.theme.primaryColor, fontSize: 12),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.withOpacity(0.4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.calendar_today_outlined,
                          ),
                          Text('Date'),
                          Icon(
                            Icons.keyboard_arrow_down_sharp,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
