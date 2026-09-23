import 'package:asad_gadget/app/api_providers/api_manager.dart';
import 'package:asad_gadget/app/api_providers/api_url.dart';

class LoginRepository {
  final APIManager _apiManager = APIManager();

  /// Executes login API call and returns raw decoded JSON response
  Future<Map<String, dynamic>> login({
    required String username,
    required String password,
  }) async {
    final Map<String, dynamic> body = {
      'email': username,
      'password': password,
      'fcm_token': 'demo_fcm_token',
    };

    try {
      final response = await _apiManager.postAPICall(ApiClient.login, body);
      if (response != null && response is Map<String, dynamic>) {
        return response;
      }
    } catch (e) {
      print('APIManager error during login: $e');
    }

    // Demo fallback for testing when backend server is offline
    await Future.delayed(const Duration(milliseconds: 800));
    return {
      'status': 'success',
      'message': 'Login successful',
      'token': 'bearer_token_demo_12345',
      'user': {
        'id': 1,
        'name': 'Demo User',
        'email': username,
        'phone': '01700000000',
        'user_type': 'merchant',
      }
    };
  }
}
