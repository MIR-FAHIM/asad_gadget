import 'package:asad_gadget/app/api_providers/api_manager.dart';
import 'package:asad_gadget/app/api_providers/api_url.dart';
import 'package:asad_gadget/app/modules/phoneVerificationWtihOTP/repo/interface.dart';

class OTPRepository extends OTPRepositoryInterface{
  @override
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

  @override
  Future verifyOTP(String mobileNumber, String otp) async {
    Map number = {'number': '$mobileNumber', 'input_value': otp};

    var headers = {
      'token':
          'UO49RKyqyc8ePi013wPnPMKrVOL0W6z9r5q4DjRRmX5g08RluPWCgzj8mSInYldXN9TjjeCsr04SRXlL1XOzzInjdzoX2SySyd9S'
    };

    APIManager _manager = APIManager();
    final response = await _manager.postAPICallWithHeader(
        ApiClient.verifyOTP, number, headers);

    print('user number: ${response['message']}');
    return response;
  }


}
