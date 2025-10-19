
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';

class LocationService extends GetxService {
  final currentLocation = {}.obs;
  final imei = ''.obs;
  final model = ''.obs;
  final imeiLoaded = false.obs;
  @override
  void onInit() async {
    print('called');
    getDeviceInfo();
    determinePosition();

    super.onInit();
  }
  // Future<PermissionStatus> getPhonePermission() async {
  //   final PermissionStatus permission = await Permission.phone.status;
  //   print("kaj ekhane hocche location service permissioon status  ${Permission.phone.status.isGranted}");
  //   if (permission != PermissionStatus.granted &&
  //       permission != PermissionStatus.denied) {
  //     final Map<Permission, PermissionStatus> permissionStatus =
  //     await [Permission.phone].request();
  //     return permissionStatus[Permission.phone] ??
  //         PermissionStatus.restricted;
  //
  //     }
  //   if (permission == PermissionStatus.granted) {
  //
  //    print("permision ache *********");
  //    return permission;
  //   }
  //   else {
  //     print("kaj ekhane hocche location service theke");
  //
  //
  //     return permission;
  //   }
  // }
  getDeviceInfo() async {
    try {
      print("hlw bro hlw bro here:");
      var status = Permission.phone;
      if (await Permission.phone.request().isGranted) {
        print('hlw bro hlw bro imei: ${imei.value}');


        print('hlw bro imei imei: ${imei.value}');
      } else {
        Permission.phone.request();


        imei.update((val) {});

        print('hlw bro imei imei: ${imei.value}');
        print('hlw bro device model: ${model.value}');
      }
    } on PlatformException catch (e) {
      // Permission.phone.request();
      print('Failed to get platform version: $e');
    }
  }

  Future<Map> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.

        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.

      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position =
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude, position.longitude,);
    Placemark place = placemarks[0];
    String city = '${place.locality == '' ? place.administrativeArea : place.locality}';
    Map m = {
      'lat': position.latitude,
      'lng': position.longitude,
      'city': city,
    };
    currentLocation.value = m;
    return m;
  }
}
