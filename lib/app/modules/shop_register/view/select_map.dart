import 'dart:async';
import 'package:asad_gadget/app/modules/shop_register/controller/shop_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapSelection extends GetView<ShopRegisterController> {
  MapSelection({super.key});

  final Completer<GoogleMapController> _gmController = Completer();

  Future<void> _goToMyLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Location', 'Please enable location services');
      return;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Permission', 'Location permission denied');
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Permission', 'Location permission permanently denied');
      return;
    }

    final pos = await Geolocator.getCurrentPosition();
    final mapController = await _gmController.future;
    final target = LatLng(pos.latitude, pos.longitude);
    controller.setLocation(target);
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: target, zoom: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick a location')),
      body: Obx(() {
        final marker = (controller.selectedLat.value != null &&
            controller.selectedLng.value != null)
            ? {
          Marker(
            markerId: const MarkerId('picked'),
            position: LatLng(
              controller.selectedLat.value!,
              controller.selectedLng.value!,
            ),
            draggable: true,
            onDragEnd: (p) => controller.setLocation(p),
          )
        }
            : <Marker>{};

        return GoogleMap(
          myLocationButtonEnabled: false,
          myLocationEnabled: true, // shows blue dot (needs permission)
          compassEnabled: true,
          mapToolbarEnabled: false,
          initialCameraPosition: controller.cameraPos.value,
          markers: marker,
          onTap: (pos) => controller.setLocation(pos),
          onMapCreated: (gm) => _gmController.complete(gm),
        );
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton.small(
              heroTag: 'myLoc',
              onPressed: _goToMyLocation,
              child: const Icon(Icons.my_location),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.check),
              label: const Text('Use this location'),
              onPressed: () {
                final lat = controller.selectedLat.value;
                final lng = controller.selectedLng.value;
                if (lat == null || lng == null) {
                  Get.snackbar('Pick a spot', 'Tap on the map to drop a pin');
                  return;
                }
                // Return to previous screen with result
                Get.back(result: {'lat': lat, 'lng': lng});
              },
            ),
          ],
        ),
      ),
    );
  }
}
