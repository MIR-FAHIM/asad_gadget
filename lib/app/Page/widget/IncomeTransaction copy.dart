import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/app/Page/sale_payment_system.dart';
import 'package:asad_gadget/common/Color.dart';

class Income extends StatelessWidget {
  const Income({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Container(
          width: _width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name'.tr + ' : ' + 'Mobile'.tr,
                      style: TextStyle(
                          color: Color(0xFF652981),
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Qty : 2"),
                          Text("Cost : 10tk"),
                          Text("Amount : 20tk"),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name'.tr + ' : ' + 'Battery'.tr,
                      style: TextStyle(
                          color: Color(0xFF652981),
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Qty : 10"),
                          Text("Cost : 20tk"),
                          Text("Amount : 200tk"),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name'.tr + ' : ' + 'Battery'.tr,
                      style: TextStyle(
                          color: Color(0xFF652981),
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Qty : 10"),
                          Text("Cost : 20tk"),
                          Text("Amount : 200tk"),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Colors.grey[400],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name'.tr + ' : ' + 'Charger'.tr,
                      style: TextStyle(
                          color: Color(0xFF652981),
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Qty : 2"),
                          Text("Cost : 100tk"),
                          Text("Amount : 200tk"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              lineGap(),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 2,
                color: Colors.grey,
              ),
              lineGap(),
              InkWell(
                onTap: () {
                  Get.to(SalePaymentSystem());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.payment,
                              color: AppColors.primaryColor,
                              size: 15,
                            ),
                            IconGap(),
                            Text('Total'.tr + ' : ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColor,
                                )),
                            Text("১০,০০০ Tk",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54)),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.arrow_forward,
                                size: 25,
                                color: Color(0xFF652981),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  SizedBox lineGap() {
    return SizedBox(
      height: 10,
    );
  }

  SizedBox IconGap() {
    return SizedBox(
      width: 4,
    );
  }
}
