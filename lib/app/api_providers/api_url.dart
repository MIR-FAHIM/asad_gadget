//155 api

class ApiClient {
  String api_token = '';

  static const String baseUrl = 'http://asadgadget.com/';

  static const String login = '${baseUrl}login';
  static const String register = '${baseUrl}register';
  static const String getAllProducts = '${baseUrl}get-products';
  static const String getShopByUser = '${baseUrl}get-shop-by-dsr/';
  static const String getAllCategories = '${baseUrl}categories';
  static const String getAllBrands = '${baseUrl}brands';
  static const String relatedProducts = '${baseUrl}products/related/3';
  static const String addCart = '${baseUrl}cart';
  static const String addCartItems = '${baseUrl}cart-item';
  static const String addOrder = '${baseUrl}order';
  static const String getCartByUser = '${baseUrl}cart/1';
  static const String getCartItem = '${baseUrl}cart-items/';
  static const String getOrderByUser = '${baseUrl}orders/';
  static const String getShopList = '${baseUrl}get-shops';
  static const String deleteCartItem = '${baseUrl}cart/item/';
  static const String updateCartItem = '${baseUrl}cart-item-update/';
  static const String markDeliver = '${baseUrl}order/deliver/';
  static const String getVisitByUser = '${baseUrl}visit/user/';
  static const String checkNumber = '${baseUrl}check-number/';
  static const String saveImage = '${baseUrl}save-image';
  static const String getZone = 'https://shl.com.bd/api/appapi/districts2';
  static const String sendotp = 'https://shl.com.bd/api/appapi/sendOTP';
  static const String verifyOTP = 'https://shl.com.bd/api/appapi/OTPVerify';

}
