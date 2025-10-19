import 'dart:async';
import 'package:asad_gadget/common/ui.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class ConnectivityController extends GetxController {
  // This variable: 0 = No Internet, 1 = connected to WIFI, 2 = connected to Mobile Data, 3 = Ethernet, 4 = Bluetooth, 5 = VPN
  RxInt connectionType = 0.obs;
  // Instance of Flutter Connectivity
  final Connectivity _connectivity = Connectivity();
  // Stream to keep listening to network change state
  // Changed to StreamSubscription<List<ConnectivityResult>>
  late StreamSubscription<List<ConnectivityResult>> _streamSubscription;

  @override
  void onInit() {
    super.onInit();
    getConnectionType();
    // Listen to changes in connectivity results (which is now a list)
    _streamSubscription = _connectivity.onConnectivityChanged.listen(_updateState);
  }

  /// A method to get the current connection type.
  /// It checks connectivity and updates the state.
  Future<void> getConnectionType() async {
    List<ConnectivityResult> connectivityResults;
    try {
      // checkConnectivity() now returns Future<List<ConnectivityResult>>
      connectivityResults = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print('Error checking connectivity: $e');
      // If an error occurs, assume no connection for safety
      connectivityResults = [ConnectivityResult.none];
    }
    return _updateState(connectivityResults);
  }

  /// Updates the connection state based on the list of ConnectivityResult.
  /// Prioritizes Wi-Fi, then Mobile, then other types, finally None.
  _updateState(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.wifi)) {
      connectionType.value = 1; // Connected to Wi-Fi
    } else if (results.contains(ConnectivityResult.mobile)) {
      connectionType.value = 2; // Connected to Mobile Data
    } else if (results.contains(ConnectivityResult.ethernet)) {
      connectionType.value = 3; // Connected to Ethernet
    } else if (results.contains(ConnectivityResult.bluetooth)) {
      connectionType.value = 4; // Connected via Bluetooth
    } else if (results.contains(ConnectivityResult.vpn)) {
      connectionType.value = 5; // Connected via VPN
    } else if (results.contains(ConnectivityResult.none)) {
      connectionType.value = 0; // No Internet connection
      // Show snackbar only if there's genuinely no connection at all
      Get.showSnackbar(Ui.ErrorSnackBar(message: 'Please turn on your internet connection and try again.', title: 'No internet connection.'));
    } else {
      // Default case if a new type is introduced or unexpected result
      connectionType.value = 0;
      Get.showSnackbar(Ui.ErrorSnackBar(message: 'Unknown connection type. Please check your internet connection.', title: 'Connection Issue.'));
    }
    update(); // Notify GetX consumers about the state change
  }

  @override
  void onClose() {
    // Cancel the stream subscription to prevent memory leaks
    _streamSubscription.cancel();
    super.onClose();
  }
}