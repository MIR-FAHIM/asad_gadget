
import 'package:asad_gadget/app/modules/asadgadgets/home/views/home_view.dart';
import 'package:asad_gadget/app/modules/asadgadgets/home/views/shop_home_view.dart';
import 'package:asad_gadget/app/modules/asadgadgets/order/binding/order_binding.dart';
import 'package:asad_gadget/app/modules/asadgadgets/order/view/cart_view.dart';
import 'package:asad_gadget/app/modules/asadgadgets/order/view/deliver_success.dart';
import 'package:asad_gadget/app/modules/asadgadgets/order/view/my_order_list.dart';
import 'package:asad_gadget/app/modules/asadgadgets/order/view/shop_selection.dart';
import 'package:asad_gadget/app/modules/asadgadgets/order/view/view_summary.dart';
import 'package:asad_gadget/app/modules/asadgadgets/order/view/order_details.dart';
import 'package:asad_gadget/app/modules/asadgadgets/order/view/order_success_page.dart';
import 'package:asad_gadget/app/modules/asadgadgets/order/view/order_view.dart';
import 'package:asad_gadget/app/modules/phoneVerificationWtihOTP/bindings/phone_verification_wtih_o_t_p_binding.dart';
import 'package:asad_gadget/app/modules/shop_register/view/register_tab.dart';
import 'package:asad_gadget/app/modules/visit/view/road_map.dart';
import 'package:asad_gadget/app/modules/asadgadgets/products/binding/product_binding.dart';
import 'package:asad_gadget/app/modules/asadgadgets/products/view/product_view.dart';

import 'package:asad_gadget/app/modules/shop_register/binding/shop_register_binding.dart';
import 'package:asad_gadget/app/modules/shop_register/view/mobile_register.dart';
import 'package:asad_gadget/app/modules/shop_register/view/otp_check.dart';
import 'package:asad_gadget/app/modules/shop_register/view/select_map.dart';
import 'package:asad_gadget/app/modules/shop_register/view/shop_register_by_dsr/shop_register_by_dsr.dart';
import 'package:asad_gadget/app/modules/shop_register/view/success_register.dart';
import 'package:asad_gadget/app/modules/shop_register/view/set_password.dart';
import 'package:asad_gadget/app/modules/shop_register/view/shop_info.dart';
import 'package:asad_gadget/app/modules/visit/binding/visit_binding.dart';
import 'package:asad_gadget/app/modules/visit/view/visit_map.dart';
import 'package:asad_gadget/app/modules/visit/view/vist_view.dart';
import 'package:get/get.dart';




import 'package:asad_gadget/app/modules/asadgadgets/login/bindings/login_binding.dart';
import 'package:asad_gadget/app/modules/asadgadgets/login/views/login_view.dart';


import 'package:asad_gadget/app/modules/asadgadgets/home/views/profile/profile_view.dart';




import '../modules/current_due/bindings/current_due_binding.dart';
import '../modules/current_due/views/current_due_view.dart';

import '../modules/asadgadgets/home/bindings/home_binding.dart';

import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';

import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';


import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';


import '../modules/webview/bindings/webview_binding.dart';
import '../modules/webview/views/webview_view.dart';
import '../modules/welcome/bindings/welcome_binding.dart';
import '../modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;
  // static const INITIAL = Routes.Test;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
 GetPage(
      name: _Paths.SHOP_DASHBOARD,
      page: () => ShopDashboardPage(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: _Paths.PROFILEVIEW,
      page: () => ProfileView(),
      binding: HomeBinding(),
    ),

GetPage(
      name: _Paths.ORDERVIEW,
      page: () => OrderView(),
      binding: OrderBinding(),
    ),
GetPage(
      name: _Paths.MYORDER,
      page: () => MyOrderList(),
      binding: OrderBinding(),
    ),
GetPage(
      name: _Paths.NEWORDER,
      page: () => NewOrder(),
      binding: OrderBinding(),
    ),
GetPage(
      name: _Paths.ROADMAP,
      page: () => RoadMapView(),
      binding: VisitBinding(),
    ),
GetPage(
      name: _Paths.VISIT_LIST,
      page: () => VisitView(),
      binding: VisitBinding(),
    ),
GetPage(
      name: _Paths.VISIT_MAP,
      page: () => VisitMap(),
      binding: VisitBinding(),
    ),

    GetPage(
      name: _Paths.ORDERDETAILS,
      page: () => OrderDetailsView(),
      binding: OrderBinding(),
    ),
GetPage(
      name: _Paths.ORDERSUCCESS,
      page: () => OrderSuccessView(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: _Paths.DELIVER_SUCCESS,
      page: () => DeliverSuccessView(),
      binding: OrderBinding(),
    ),


    GetPage(
      name: _Paths.CARTVIEW,
      page: () => CartView(),
      binding: OrderBinding(),
    ),
  GetPage(
      name: _Paths.SHOP_LIST,
      page: () => ShopListView(),
      binding: OrderBinding(),
    ),


GetPage(
      name: _Paths.PRODUCTLIST,
      page: () => ProductListUI(),
      binding: ProductBinding(),
    ),

    // GetPage(
    //   name: _Paths.BUS_TICKET,
    //   page: () => BusTicketView(),
    //   binding: BusTicketBinding(),
    // ),


    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),





    GetPage(
      name: _Paths.ROOT,
      page: () => RootView(),
      binding: RootBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    // GetPage(
    //   name: _Paths.termandCOndition,
    //   page: () => TermAndCOndition(),
    //   binding: SplashscreenBinding(),
    // ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),



    GetPage(
      name: _Paths.SETTINGS,
      page: () => SettingsView(),
      binding: SettingsBinding(),
    ),




    GetPage(
      name: _Paths.WEBVIEW,
      page: () => WebviewView(),
      binding: WebviewBinding(),
    ),
 GetPage(
      name: _Paths.SHOPPHONENO,
      page: () => CheckPhoneNumberView(),
      binding: ShopRegisterBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_VERIFICATION_WTIH_O_T_P,
      page: () => PhoneVerificationWtihOTPView(),
      binding: PhoneVerificationWtihOTPBinding(),
    ),
    GetPage(
      name: _Paths.SHOP_REG_BY_DSR,
      page: () => ShopRegisterByDsr(),
      binding: ShopRegisterBinding(),
    ),
    GetPage(
      name: _Paths.MAP_SELECTION,
      page: () => MapSelection(),
      binding: ShopRegisterBinding(),
    ),

GetPage(
      name: _Paths.VERIFYOTP,
      page: () => PhoneVerificationWtihOTPView(),
      binding: ShopRegisterBinding(),
    ),
GetPage(
      name: _Paths.REGISTER_TAB,
      page: () => RegisterTabView(),
      binding: ShopRegisterBinding(),
    ),

GetPage(
      name: _Paths.SHOP_INFO_REGISTER,
      page: () => RegisterShopInfo(),
      binding: ShopRegisterBinding(),
    ),
GetPage(
      name: _Paths.SET_PASSWORD,
      page: () => SetPassword(),
      binding: ShopRegisterBinding(),
    ),

GetPage(
      name: _Paths.SUCCESS_SHOP_REGISTER,
      page: () => SuccessShopRegister(),
      binding: ShopRegisterBinding(),
    ),




//

  ];
}
