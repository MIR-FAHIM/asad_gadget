import 'package:asad_gadget/app/modules/asadgadgets/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:asad_gadget/app/Page/installment_page.dart';

import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/common/ui.dart';

class IconModel {
  String? title;
  String? image;
  VoidCallback? press;
  IconModel({this.title, this.image, this.press});
}

List<IconModel> iconButtonData = [
  IconModel(
      title: 'Mobile Recharge',
      image: "assets/images/phone.png",
      press: () {
        // Get.offNamed(Routes.RECHARGE);;

        Get.toNamed(Routes.RECHARGE);

      }),
  IconModel(
      title: 'Mobile Banking',
      image: "assets/images/mobile_banking.png",
      press: () {
        if (Get.find<HomeController>()
                    .getPermissionModel
                    .value
                    .data!
                    .allowCashin ==
                0 &&
            Get.find<HomeController>()
                    .getPermissionModel
                    .value
                    .data!
                    .allowCashout ==
                0 &&
            Get.find<HomeController>()
                    .getPermissionModel
                    .value
                    .data!
                    .allowMoneyout ==
                0) {
          Get.showSnackbar(Ui.ErrorSnackBar(
              message:
                  "আপনার বর্তমান প্যাকেজটির জন্য এম-ব্যাংকিং সার্ভিস টি অনুমোদিত নয়",
              title: 'Error'.tr));
        } else {
          Get.toNamed(Routes.CASHINOUT);
        }
      }),
  IconModel(
      title: 'Bill Payment',
      image: "assets/images/bill_payment.png",
      press: () {

      }),
  // IconModel(
  //     title: 'Add Balance',
  //     image: "assets/images/list.png",
  //     press: () {
  //       Get.toNamed(Routes.Add_Balance_Dashboard_View);
  //     }),

  IconModel(
      title: 'E-ticketing',
      image: "assets/images/booking.png",
      press: () {

      }),
  IconModel(
      title: 'Sales',
      image: "assets/images/cart.png",
      press: () {
        Get.showSnackbar(
            Ui.ErrorSnackBar(message: "Coming soon.....", title: 'Error'.tr));
       //   Get.toNamed(Routes.SALES);
       // Get.toNamed(Routes.SMS_VIEW);
        //   Get.toNamed(Routes.DONATIONHOMEPAGE);
        //  Get.toNamed(Routes.USERTYPE);
        //  Get.to(SalePage());
      }),
  IconModel(
      title: 'My shop',
      image: "assets/images/shop.png",
      press: () {
        Get.showSnackbar(
            Ui.ErrorSnackBar(message: "Coming soon.....", title: 'Error'.tr));
        //Get.toNamed(Routes.SHOP_INFO);
      }),
];

List<IconModel> billPayment = [
  IconModel(
      title: 'Electricity',
      image: "assets/bill/elect.png",
      press: () {
        Get.toNamed(Routes.ELECTRICITY_BILL);
      }),
  IconModel(
      title: 'Gas',
      image: "assets/bill/GAS.png",
      press: () {
        Get.toNamed(Routes.WATER_BILL);
      }),
  IconModel(
      title: 'Water',
      image: "assets/bill/Water-Bill.png",
      press: () {
        Get.toNamed(Routes.GAS_BILL);
      }),
  IconModel(
      title: 'Telephone',
      image: "assets/bill/Telephone.png",
      press: () {
        Get.toNamed(Routes.TELEPHONE_BILL);
      }),
  IconModel(
      title: 'TV',
      image: "assets/bill/TV.png",
      press: () {
        Get.toNamed(Routes.DTH_BILL);
      }),
  IconModel(
      title: 'Internet',
      image: "assets/bill/int.png",
      press: () {
        Get.toNamed(Routes.INTERNET_BILL);
      }),
];

List<IconModel> saless = [
  IconModel(
      title: 'Sell',
      image: "assets/sales/sell.png",
      press: () {
        print("sell tapped");
        Get.toNamed(Routes.SALE_NOW);
      }),
  IconModel(
      title: 'Buy',
      image: "assets/sales/buy.png",
      press: () {
        Get.toNamed(Routes.BUY_PRODUCT);
      }),
  IconModel(
      title: 'Due',
      image: "assets/sales/due.png",
      press: () {
        Get.toNamed(Routes.Due_DashBoard);
      }),
  IconModel(
      title: 'Consumption',
      image: "assets/sales/cost.png",
      press: () {
        Get.toNamed(Routes.EXPENSES_REPORT);
        //Get.to(ExpenseDashBoard());
      }),
  IconModel(
      title: 'Customer',
      image: "assets/images/user.png",
      press: () {
        Get.toNamed(Routes.CUSTOMERS);
      }),
  IconModel(
      title: 'Vendors',
      image: "assets/images/shop.png",
      press: () {
        Get.toNamed(Routes.VENDORS);
      }),
  IconModel(
      title: 'Product',
      image: "assets/sales/product.png",
      press: () {
        Get.toNamed(Routes.PRODUCT_LIST_FOR_BUY);
        //Get.to(BuyListItem());
      }),
];

List<IconModel> banks = [
  IconModel(title: 'City Bank', image: "assets/city.jpeg", press: () {}),
  IconModel(title: 'DBBL', image: "assets/dbbl.jpeg", press: () {}),
  IconModel(title: 'EBL', image: "assets/ebl.jpeg", press: () {}),
  IconModel(title: 'UCB', image: "assets/ucb.jpeg", press: () {}),
];

List<IconModel> mobileBank = [
  IconModel(title: 'Bkash', image: "assets/bk.jpeg", press: () {}),
  IconModel(title: 'Nagad', image: "assets/ng.jpeg", press: () {}),
  IconModel(title: 'Rocket', image: "assets/rocket.jpeg", press: () {}),
  IconModel(title: 'Upay', image: "assets/upay.jpeg", press: () {}),
  IconModel(title: "Tap'n Pay", image: "assets/tappay.jpeg", press: () {}),
];

List<IconModel> linkShare = [
  IconModel(title: 'Bkash', image: "assets/link/phone.png", press: () {}),
  IconModel(title: 'Nagad', image: "assets/link/fb.png", press: () {}),
  IconModel(title: 'Rocket', image: "assets/link/wh.png", press: () {}),
  IconModel(title: 'Upay', image: "assets/link/imo.png", press: () {}),
];

List<IconModel> simOperators = [
  IconModel(title: '017', image: "assets/sim/gp.png", press: () {}),
  IconModel(title: '013', image: "assets/sim/gp.png", press: () {}),
  IconModel(title: '018', image: "assets/sim/robi.png", press: () {}),
  IconModel(title: '014', image: "assets/sim/bl.png", press: () {}),
  IconModel(title: '019', image: "assets/sim/bl.png", press: () {}),
  IconModel(title: '016', image: "assets/sim/art.png", press: () {}),
  IconModel(title: '015', image: "assets/sim/teletalk.png", press: () {}),
];

List<IconModel> eticket = [
  IconModel(title: 'Biman', image: "assets/eticket/plane.png", press: () {}),
  IconModel(
      title: 'Bus',
      image: "assets/eticket/bus.png",
      press: () {
        print("bus working ");
        Get.back();
        Get.toNamed(Routes.BUS_TICKET);
      }),
  IconModel(title: 'Launch', image: "assets/eticket/ship.png", press: () {}),
  IconModel(title: 'Movie', image: "assets/eticket/movie.png", press: () {}),
  IconModel(title: 'Train', image: "assets/eticket/train.png", press: () {}),
];

List<IconModel> waterBill = [
  IconModel(title: 'Khulna WASA', image: "assets/bill/dwasa.png", press: () {}),
  IconModel(title: 'Dhaka WASA', image: "assets/bill/kwasa.png", press: () {}),
  IconModel(
      title: 'Rajshahi WASA', image: "assets/bill/rwasa.jpg", press: () {}),
];

List<IconModel> gasBill = [
  IconModel(
      title: 'Jalalabad', image: "assets/bill/jalalabad.png", press: () {}),
  IconModel(
      title: 'Bakhrabad Gas', image: "assets/bill/bakhrabad.png", press: () {}),
  IconModel(
      title: 'Pashchimanchal Gas', image: "assets/bill/pgcl.png", press: () {}),
];

List<IconModel> tvBill = [
  IconModel(
      title: 'Akash DTH', image: "assets/bill/Akash-Logo.png", press: () {}),
  IconModel(
      title: 'Sylhet Cable Vision', image: "assets/bill/scs.jpg", press: () {}),
  IconModel(
      title: 'Bengal Digital',
      image: "assets/bill/bengal_digital.jpg",
      press: () {}),
  IconModel(
      title: 'Bumbell Bee', image: "assets/bill/bumbell.png", press: () {}),
  IconModel(
      title: 'Nation Electronics & Cable Networks',
      image: "assets/bill/nation.jpeg",
      press: () {}),
];

List<IconModel> internetBill = [
  IconModel(
      title: 'BTCL Bangladesh', image: "assets/bill/btcl.png", press: () {}),
  IconModel(
      title: 'Carnival', image: "assets/bill/carnival.jpeg", press: () {}),
  IconModel(
      title: 'ICC Communication', image: "assets/bill/icc.jpeg", press: () {}),
  IconModel(
      title: 'Sam Online', image: "assets/bill/sam_online.jpeg", press: () {}),
  IconModel(title: 'Amber IT', image: "assets/bill/amber.jpeg", press: () {}),
];

List<IconModel> telephoneBill = [
  IconModel(title: 'BTCL', image: "assets/bill/btcl.png", press: () {}),
  IconModel(
      title: 'AmberIT IP Phone',
      image: "assets/bill/amber_phone.jpeg",
      press: () {}),
  IconModel(
      title: 'BTCL Alaap', image: "assets/bill/BTCL_Alaap.png", press: () {}),
  IconModel(
      title: 'Brilliant Connect',
      image: "assets/bill/brilliant_connect.jpg",
      press: () {}),
];

List<IconModel> paymentMethod = [
  IconModel(
      title: 'Hand Cash',
      image: "assets/images/hand.png",
      press: () {
        //Get.to(TransactionSuccessful());
      }),
  IconModel(
      title: 'EMI',
      image: "assets/recharge/cash.png",
      press: () {
        InstallmentPage();
      }),
  IconModel(
      title: 'Digital Payment', image: "assets/sales/cost.png", press: () {}),
  IconModel(
      title: 'Due Book',
      image: "assets/images/list.png",
      press: () {

      }),
];
