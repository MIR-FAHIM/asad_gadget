import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:asad_gadget/app/Page/sale_payment_system.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:asad_gadget/common/ui.dart';

class AllItemListView extends StatelessWidget {
  final _size = Get.size;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.SecondbackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(65, 65),
        child: AppBar(
          backgroundColor: Color(0xFF652981),
          centerTitle: true,
          title: Text('Total Sell Item'.tr),
          elevation: 0,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: _size.width,
                  color: AppColors.homeCardBg,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 15, top: 10, bottom: 10, right: 10),

                              /// Image item
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/collection/1.png')),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black12.withOpacity(0.1),
                                            blurRadius: 0.5,
                                            spreadRadius: 0.1)
                                      ]),
                                  child: Container(
                                    height: 40.0,
                                    width: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.0)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/collection/1.png')),
                                    ),
                                  ))),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 5.0, left: 5.0, right: 5.0),
                            child: Column(
                              /// Text Information Item
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    'মো. আবদুল',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Sans",
                                        color: Colors.black87,
                                        fontSize: 14.0),
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                                Text(
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
                        padding: const EdgeInsets.only(top: 20, right: 15),
                        child: Image.asset(
                          "assets/icons/edit_icon02.png",
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 8.0,
                ),
                Container(
                  width: _size.width,
                  color: AppColors.homeCardBg,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                      'পণ্য তালিকা',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: "Sofia",
                          color: AppColors.homeTextColor3,
                          fontSize: 22),
                    ),
                  ),
                ),
                //product
                Container(
                  width: _size.width,
                  color: AppColors.homeCardBg,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(10.0),

                                /// Image item
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/hand.png')),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12
                                                  .withOpacity(0.1),
                                              blurRadius: 0.5,
                                              spreadRadius: 0.1)
                                        ]),
                                    child: Container(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/hand.png')),
                                      ),
                                    ))),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 5.0, right: 5.0),
                              child: Column(
                                /// Text Information Item
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Oppo Mobile',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Sans",
                                        color: Colors.black87,
                                        fontSize: 14.0),
                                    overflow: TextOverflow.clip,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width: 140.0,
                                        decoration:
                                            BoxDecoration(color: Colors.white),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            /// Decrease of value item
                                            InkWell(
                                              onTap: () {
                                                // setState(() {
                                                //   value =
                                                //       value - 1;
                                                //   value =
                                                //       (value > 0
                                                //           ? value
                                                //           : 0);
                                                //   pay = items[position]
                                                //           .price *
                                                //       value;
                                                //   total = pay +
                                                //       delivery;
                                                // });
                                              },
                                              child: Container(
                                                height: 20.0,
                                                width: 20.0,
                                                decoration: BoxDecoration(
                                                    color: Colors.black12
                                                        .withOpacity(0.1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0))),
                                                child: Center(
                                                    child: Text(
                                                  "-",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 18.0),
                                                )),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 18.0),
                                              child: Text(
                                                "2",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w800,
                                                    fontFamily: "Sofia",
                                                    fontSize: 14.0),
                                              ),
                                            ),

                                            /// Increasing value of item
                                            InkWell(
                                              onTap: () {
                                                // setState(() {
                                                //   value =
                                                //       value + 1;
                                                //   pay = items[position]
                                                //           .price *
                                                //       value *
                                                //       2;
                                                //   total = pay +
                                                //       delivery;
                                                // });
                                              },
                                              child: Container(
                                                height: 20.0,
                                                width: 20.0,
                                                decoration: BoxDecoration(
                                                    color: Color(0xFF652981),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                5.0))),
                                                child: Center(
                                                    child: Text(
                                                  "+",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 18.0),
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),

                                  // Text(
                                  //   ' x ১',
                                  //   style: TextStyle(
                                  //       fontWeight: FontWeight.w300,
                                  //       fontFamily: "Sofia",
                                  //       color: Colors.black,
                                  //       fontSize: 12),
                                  //   overflow: TextOverflow.ellipsis,
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 15),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "\$" + '15',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Sofia",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                "assets/icons/right_arrow.png",
                                width: 15,
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                InkWell(
                  onTap: () {
                    _showBottomSheet(context);

                    // );
                  },
                  child: Container(
                    width: _size.width,
                    color: AppColors.homeCardBg,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 15.0, left: 20.0, right: 20.0, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Discount'.tr,
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Sofia",
                              fontSize: 14.5,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "৳" + "0.00",
                                style: TextStyle(
                                  color: AppColors.homeTextColor3,
                                  fontFamily: "Sofia",
                                  fontSize: 14.5,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                "assets/icons/right_arrow.png",
                                width: 15,
                                height: 15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Container(
                //   height: 0.2,
                //   color: Colors.black,
                // ),
                // Container(
                //   width: _size.width,
                //   color: AppColors.homeCardBg,
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //         bottom: 15.0, left: 20.0, right: 20.0, top: 15),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: <Widget>[
                //         Text(
                //           'Total'.tr,
                //           style: TextStyle(
                //               color: Colors.black,
                //               fontFamily: "Sofia",
                //               fontSize: 16.5,
                //               fontWeight: FontWeight.w700),
                //         ),
                //         Text(
                //           "৳" + "35",
                //           style: TextStyle(
                //               color: Colors.black,
                //               fontFamily: "Sofia",
                //               fontSize: 16.5,
                //               fontWeight: FontWeight.w700),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Container(
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
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: InkWell(
                onTap: () {
                  Get.to(SalePaymentSystem());
                },
                child: Container(
                  width: _size.width,
                  height: _size.width * .1,
                  decoration:
                      Ui.getBoxDecoration(color: Color(0xFF652981), radius: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Total'.tr + " ৳০.০০",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showBottomSheet(BuildContext context) async {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Column(
                  children: [
                    Container(
                      height: _size.height * 0.3,
                      width: _size.width,
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(25)),
                      alignment: Alignment.center,
                      child: Material(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'ডিসকাউন্টের পরিমাণ (% অথবা ৳)'.tr,
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Container(
                                  width: _size.width * 0.9,
                                  height: 80,
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 14, left: 20, right: 20),
                                  margin: EdgeInsets.only(
                                      left: 15, right: 15, top: 10, bottom: 10),
                                  decoration: Ui.getBoxDecoration(
                                    color: Colors.white,
                                    radius: 8,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      // Text(
                                      //   "Discount Amount".tr,
                                      //   style: Get.textTheme.bodyText1,
                                      //   textAlign: TextAlign.start,
                                      // ),
                                      // SizedBox(
                                      //   height: 15,
                                      // ),
                                      TextField(
                                        // controller: controller.nameController,
                                        keyboardType: TextInputType.number,
                                        style: Get.textTheme.bodyMedium,

                                        // validator: (input) {
                                        //   if (controller.nameController.text.isEmpty) {
                                        //     return 'This field is required'.tr;
                                        //   } else {
                                        //     return null;
                                        //   }
                                        // },

                                        cursorColor: Color(0xFF652981),
                                        decoration: InputDecoration(
                                            hintText: "Enter Input".tr,
                                            border: InputBorder.none),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            // TextFieldWidget(
                            //   labelText: "Discount Amount".tr,
                            //   hintText: "Enter Input".tr,
                            //   onChanged: (value) {},

                            //   // onSaved: (input) =>
                            //   // controller.currentUser.value.email = input,
                            //   // validator: (input) => !input!.contains('@') ? "Should be a valid email".tr : null,
                            //   iconData: null,
                            //   // imageData: 'assets/collection/2.png',
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      width: 120,
                                      height: _size.width * .10,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              'Cancel'.tr,
                                              style: Get.textTheme.headlineSmall!
                                                  .merge(TextStyle(
                                                      color: AppColors
                                                          .primaryColor,
                                                      fontSize: 13)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      width: 120,
                                      height: _size.width * .10,
                                      decoration: Ui.getBoxDecoration(
                                          color: Color(0xFF652981), radius: 10),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              'Confirm'.tr,
                                              style: Get.textTheme.headlineSmall!
                                                  .merge(TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
