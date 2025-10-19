import 'dart:convert';

import 'package:asad_gadget/app/models/district_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:asad_gadget/app/api_providers/api_manager.dart';
import 'package:asad_gadget/app/api_providers/api_url.dart';
import 'package:asad_gadget/app/models/buysell/customer_model.dart';
import 'package:asad_gadget/app/models/nid_data_model.dart';
import 'package:asad_gadget/app/services/auth_service.dart';

class AuthRepository {
  final userdata = GetStorage();

  ///User Registration api call
  Future userRegistration(Map data) async {
    print(data);

    APIManager _manager = APIManager();
    final _response = await _manager.postAPICall(ApiClient.register, data);

    print('user registration: ${_response['Status']}');

    return _response;
  }
  Future uplaodDocImage({String? image , String? userID, String? type}) async {

    APIManager _manager = APIManager();


    Map accountData = {
      "image": image!,
      "user_id": userID,
      "type": type,
      "is_active": '1',
    };



    final response = await _manager
        .postAPICall(ApiClient.saveImage, accountData);

    print('account data image +++++++++++++: ${response}');
    return response;
  }
  ///User login api call
  userLogin(String phoneNumber, String pass) async {
    Map _loginData = {
      'email': phoneNumber,
      'phone': 'no data',
      'password': '$pass',
      'fcm_token': 'test_fcm_token',
    };

    Map _loginDataMobile = {
      'phone': phoneNumber,
      'email': 'no data',
      'password': '$pass',
      'fcm_token': 'test_fcm_token',
    };

    APIManager _manager = APIManager();
    final response = await _manager.postAPICall(ApiClient.login,
        phoneNumber.isPhoneNumber ? _loginDataMobile : _loginData);

    print('user login: ${response}');

    return response;
  }
  getShopByDSR(id) async {


    APIManager _manager = APIManager();
    final response = await _manager.get(ApiClient.getShopByUser + id.toString());

    print('get shop dsr: ${response}');

    return response;
  }
  checkNumber(number) async {


    APIManager _manager = APIManager();
    final response = await _manager.get(ApiClient.checkNumber + number.toString());

    print('get shop dsr: ${response}');

    return response;
  }
  Future otpSend(String mobileNumber) async {
    Map number = {
      'number': '$mobileNumber',
      'remark': "Merchant",

    };

    var headers = {
      'token':
      'UO49RKyqyc8ePi013wPnPMKrVOL0W6z9r5q4DjRRmX5g08RluPWCgzj8mSInYldXN9TjjeCsr04SRXlL1XOzzInjdzoX2SySyd9S'
    };

    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
        ApiClient.sendotp, number, headers);

    print('user number: ${response['message']}');
    return response;
  }
  Future<List<DistrictModel>> getdistrictType() async {
    // var headers = {'token': 'mCSBThHZH1tJxQJi4ifBdIDjTxFD0GBLFd6QpV1i'};
    APIManager _manager = APIManager();

    try{
      final response = await _manager.postAPICall(ApiClient.getZone, {});

      print('Response content: $response');

      return List.from(response.map((item) => DistrictModel.fromJson(item)));
    }catch(e){
      throw Exception('Failed to load data *****: $e');
    }



  }

}
