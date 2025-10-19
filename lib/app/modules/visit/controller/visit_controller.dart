import 'dart:async';
import 'package:asad_gadget/app/models/asad_gadget/get_products_model.dart';
import 'package:asad_gadget/app/models/asad_gadget/visit_model.dart';
import 'package:asad_gadget/app/repositories/product_repository.dart';
import 'package:asad_gadget/app/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VisitController extends GetxController {
  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  var totalAmount = 0.0.obs;
  var productNameController = TextEditingController().obs;

  final visitList = <DatumVisit>[].obs;
  final filteredVisitList = <DatumVisit>[].obs;
  var isLoading = false.obs;

  final selectedDate = DateTime.now().obs;

  // Map-related state variables
  final Completer<GoogleMapController> _gmController = Completer();
  final selectedLat = Rxn<double>();
  final selectedLng = Rxn<double>();
  final cameraPos = const CameraPosition(
    target: LatLng(23.777176, 90.399452), // Default to Dhaka, Bangladesh
    zoom: 12,
  ).obs;

  @override
  void onInit() {
    super.onInit();
    getUserVisit();

    // Check if arguments were passed to initialize the map
    if (Get.arguments != null && Get.arguments is List && Get.arguments.length == 2) {
      final lat = Get.arguments[0] as double;
      final lon = Get.arguments[1] as double;
      setLocation(LatLng(lat, lon));
      cameraPos.value = CameraPosition(target: LatLng(lat, lon), zoom: 16);
    }
  }

  // Method to fetch all visits for the user
  void getUserVisit() async {
    isLoading(true);
    try {
      final resp = await ProductRepository().getVisitByUser(Get.find<AuthService>().currentUser.value.user!.id);
      if (resp['status'] == 'success') {
        GetVisitModel model = GetVisitModel.fromJson(resp);
        visitList.value = model.data ?? [];
        // Initially filter to show today's visits
        filterVisitsByDate(DateTime.now());
      } else {
        visitList.value = [];
      }
    } catch (e) {
      print("Error fetching visits: $e");
    } finally {
      isLoading(false);
    }
  }

  // Method to filter visits based on a selected date
  void filterVisitsByDate(DateTime date) {
    final normalizedDate = DateTime(date.year, date.month, date.day);

    filteredVisitList.value = visitList.where((visit) {
      print("i am here 44");
      final visitDateTime = visit.createdAt; // Assuming `createdAt` is a DateTime
      final normalizedVisitDate = DateTime(visitDateTime.year, visitDateTime.month, visitDateTime.day);
      return normalizedVisitDate == normalizedDate;
    }).toList();
  }

  // Method called from the UI to change the selected date
  void selectDate(DateTime date) {
    selectedDate.value = date;
    filterVisitsByDate(date);
  }

  // Map-related methods
  void onMapCreated(GoogleMapController controller) {
    _gmController.complete(controller);
    // Animate to the initial location if arguments were provided
    if (selectedLat.value != null && selectedLng.value != null) {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(selectedLat.value!, selectedLng.value!),
            zoom: 16,
          ),
        ),
      );
    }
  }

  void setLocation(LatLng pos) {
    selectedLat.value = pos.latitude;
    selectedLng.value = pos.longitude;
    cameraPos.value = CameraPosition(target: pos, zoom: 16);
  }

  Future<void> goToMyLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Location', 'Please enable location services', snackPosition: SnackPosition.BOTTOM);
      return;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Permission', 'Location permission denied', snackPosition: SnackPosition.BOTTOM);
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Permission', 'Location permission permanently denied', snackPosition: SnackPosition.BOTTOM);
      return;
    }

    final pos = await Geolocator.getCurrentPosition();
    final mapController = await _gmController.future;
    final target = LatLng(pos.latitude, pos.longitude);
    setLocation(target);
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: target, zoom: 16),
      ),
    );
  }
}