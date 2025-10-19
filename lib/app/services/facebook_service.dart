// import 'package:facebook_app_events/facebook_app_events.dart';
//
// class FacebookService {
//   static final FacebookAppEvents _facebookAppEvents = FacebookAppEvents();
//
//   static Future<String> getAnonymousId() async {
//     try {
//       return await _facebookAppEvents.getAnonymousId() ?? 'Unknown';
//     } catch (e) {
//       return 'Error: $e';
//     }
//   }
//
//   static void logButtonClick() {
//     print("log button clicked ");
//     _facebookAppEvents.logEvent(
//       name: 'button_clicked',
//       parameters: {'button_id': 'the_clickme_button'},
//     );
//     print("log button clicked 11");
//   }
//
//   static void setUserData({
//     required String email,
//     required String firstName,
//     String? lastName,
//     String? dateOfBirth,
//     String? city,
//     String? country,
//     String? state,
//     String? zip,
//     String? phone,
//   }) {
//     _facebookAppEvents.setUserData(
//       email: email,
//       firstName: firstName,
//       lastName: lastName,
//       dateOfBirth: dateOfBirth,
//       city: city,
//       country: country,
//       state: state,
//       zip: zip,
//       phone: phone,
//     );
//   }
//
//   static void logAddToCart({
//     required String id,
//     required String type,
//     required double price,
//     required String currency,
//   }) {
//     _facebookAppEvents.logAddToCart(
//       id: id,
//       type: type,
//       price: price,
//       currency: currency,
//     );
//   }
//
//   static void logPurchase({required double amount, required String currency}) {
//     _facebookAppEvents.logPurchase(
//       amount: amount,
//       currency: currency,
//     );
//   }
//
//   static void setAdvertiserTracking({required bool enabled}) {
//     _facebookAppEvents.setAdvertiserTracking(enabled: enabled);
//   }
// }