import 'package:asad_gadget/app/modules/shop_register/controller/shop_register_controller.dart';
import 'package:asad_gadget/app/modules/visit/controller/visit_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VisitMap extends GetView<VisitController> {
  const VisitMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pick a location')),
      body: Obx(() {
        final marker = (Get.arguments[0] != null &&
            Get.arguments[1] != null)
            ? {
          Marker(
            markerId: const MarkerId('picked'),
            position: LatLng(
              Get.arguments[0],
              Get.arguments[1],
            ),
            draggable: true,
            onDragEnd: (p) => controller.setLocation(p),
          )
        }
            : <Marker>{};

        return GoogleMap(
          myLocationButtonEnabled: false,
          myLocationEnabled: true,
          compassEnabled: true,
          mapToolbarEnabled: false,
          initialCameraPosition: controller.cameraPos.value,
          markers: marker,
          onTap: (pos) => controller.setLocation(pos),
          onMapCreated: controller.onMapCreated,
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
              onPressed: controller.goToMyLocation,
              child: const Icon(Icons.my_location),
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.check),
              label: const Text('Use this location'),
              onPressed: () {
                final lat = controller.selectedLat.value;
                final lng = controller.selectedLng.value;
                if (lat == null || lng == null) {
                  Get.snackbar('Pick a spot', 'Tap on the map to drop a pin', snackPosition: SnackPosition.BOTTOM);
                  return;
                }
                Get.back(result: {'lat': lat, 'lng': lng});
              },
            ),
          ],
        ),
      ),
    );
  }
}