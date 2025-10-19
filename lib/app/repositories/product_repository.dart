import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:asad_gadget/app/api_providers/api_manager.dart';
import 'package:asad_gadget/app/api_providers/api_url.dart';


class ProductRepository {
  final userdata = GetStorage();

  ///User Registration api call
  Future getProduct() async {
    APIManager _manager = APIManager();
    final _response = await _manager.get(ApiClient.getAllProducts);

    return _response;
  }
 Future getVisitByUser(id) async {
    APIManager _manager = APIManager();
    final _response = await _manager.get(ApiClient.getVisitByUser + id.toString());

    return _response;
  }

  Future getCartItemByCartId(id) async {
    APIManager _manager = APIManager();
    final _response = await _manager.get(ApiClient.getCartItem + id.toString());

    return _response;
  }

  Future getAllOrder(id) async {
    APIManager _manager = APIManager();
    final _response =
        await _manager.get(ApiClient.getOrderByUser + id.toString());

    return _response;
  }

  Future getShopList() async {
    APIManager _manager = APIManager();
    final _response = await _manager.get(ApiClient.getShopList);

    return _response;
  }

  Future deleteCartItem(id) async {
    APIManager _manager = APIManager();
    final _response =
        await _manager.delete(ApiClient.deleteCartItem + id.toString());

    return _response;
  }

  Future markDeliver(id) async {
    APIManager _manager = APIManager();
    final _response = await _manager.get(ApiClient.markDeliver + id.toString());

    return _response;
  }

  Future addCart(data) async {
    APIManager _manager = APIManager();
    final _response = await _manager.postAPICall(ApiClient.addCart, data);

    return _response;
  }

  Future addOrder(data) async {
    APIManager _manager = APIManager();
    final _response = await _manager.postAPICall(ApiClient.addOrder, data);

    return _response;
  }

  Future updateCart(id, data) async {
    APIManager _manager = APIManager();
    final _response =
        await _manager.putApiCall(ApiClient.updateCartItem + id, data);

    return _response;
  }

  Future addCartItem(data) async {
    APIManager _manager = APIManager();
    final _response = await _manager.postAPICall(ApiClient.addCartItems, data);

    return _response;
  }

  ///User login api call
  userLogin(String phoneNumber, String pass) async {
    Map _loginData = {
      'email': phoneNumber,
      'password': '$pass',
      'fcm_token': 'test_fcm_token',
    };

    Map _loginDataMobile = {
      'phone': phoneNumber,
      'password': '$pass',
      'fcm_token': 'test_fcm_token',
    };

    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(ApiClient.login,
        phoneNumber.isPhoneNumber ? _loginDataMobile : _loginData);

    print('user login: ${response}');

    return response;
  }
}
