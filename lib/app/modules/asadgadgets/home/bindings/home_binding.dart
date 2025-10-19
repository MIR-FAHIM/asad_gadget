import 'package:asad_gadget/app/modules/asadgadgets/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}

class PaymentGatewayPlugin {
  static const String _storeID = 'your_store_id';
  static const String _password = 'your_password';

  static Future<String> processPayment(double amount) async {
    // Replace the following with actual logic to interact with the payment gateway API
    // and make the payment request with store ID, password, and other required parameters.

    // Example: Call a hypothetical payment gateway API method
    bool paymentSuccess = await _makePaymentRequest(amount);

    if (paymentSuccess) {
      return 'Payment successful!';
    } else {
      return 'Payment failed.';
    }
  }

  static Future<bool> _makePaymentRequest(double amount) async {
    // Replace this with actual logic to make a payment request using the payment gateway API
    // and return a boolean indicating whether the payment was successful or not.

    // Example: Call a hypothetical payment gateway API method
    // bool success = await PaymentGatewayApi.makePayment(_storeID, _password, amount);

    // Simulating a successful payment for the sake of example
    bool success = true;

    return success;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Payment Gateway Demo'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => _processPayment(),
            child: Text('Make Payment'),
          ),
        ),
      ),
    );
  }

  Future<void> _processPayment() async {
    double amount = 100.0; // Replace with the actual payment amount
    String result = await PaymentGatewayPlugin.processPayment(amount);

    // Display the payment result
    // showDialog(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return AlertDialog(
    //       title: Text('Payment Result'),
    //       content: Text(result),
    //       actions: [
    //         TextButton(
    //           onPressed: () => Navigator.of(context).pop(),
    //           child: Text('OK'),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}