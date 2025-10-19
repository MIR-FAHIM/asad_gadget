import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:asad_gadget/app/models/district_model.dart';
import 'package:asad_gadget/app/models/get_shop_by_dsr.dart';
import 'package:asad_gadget/app/repositories/auth_repositories.dart';
import 'package:asad_gadget/app/services/auth_service.dart';
import 'package:asad_gadget/app/services/location_service.dart';
import 'package:asad_gadget/common/ui.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ShopRegisterController extends GetxController {
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;
  final tradeImageFrontFile = File('').obs;
  final nidFile = File('').obs;
  final shopImage = File('').obs;
  final tradeImageFrontString = ''.obs;

  final shopImageString = ''.obs;
  final nidString = ''.obs;

  // GlobalKey for the form, used for validation
  final isChecked = false.obs;
  final phoneNumber = TextEditingController().obs;
  final email = TextEditingController().obs;
  final passWord = TextEditingController().obs;
  final confirmPassWord = TextEditingController().obs;
  final shopName = TextEditingController().obs;
  RxInt codeVerifyTime = 60.obs;

  final shopNameController = TextEditingController().obs;
  final ownerNameController = TextEditingController().obs;
  final addressController = TextEditingController().obs;
  final isRegistered = ''.obs;
  final code = ''.obs;
  final codeController = TextEditingController().obs;
  late TextEditingController codeController2;
  //final registrationInf = RegistrationPaymentInformationModel().obs;
  String _comingSms = 'Unknown';
  final serviceTypeID = ''.obs;
  final newCode = ''.obs;
  final shopListByDSR = <DatumShopDSR>[].obs;
  final weekdayLabels =
      <String>["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"].obs;
  final zoneList = <DistrictModel>[].obs;

  final visitDays = <String>[].obs;
  final isValidPhone = false.obs;
  final selectedZoneId = 0.obs;
  var isLoading = false.obs;
  final selectedLat = RxnDouble();
  final selectedLng = RxnDouble();
  final cameraPos = const CameraPosition(
    target: LatLng(23.8103, 90.4125), // Dhaka
    zoom: 12,
  ).obs;
  @override
  Future<void> onInit() async {
    verifyTimeStart();
    initSmsListener();
    getZone();
    getShopByDsr(Get.find<AuthService>().currentUser.value.user!.id.toString());
    super.onInit();
    print('HomeController.onInit');
  }

  void verifyTimeStart() {
    var duration = const Duration(seconds: 1);
    Timer.periodic(duration, (timer) {
      if (codeVerifyTime.value == 0) {
        timer.cancel();
      } else {
        codeVerifyTime.value -= 1;
      }
    });
  }

  void setLocation(LatLng pos) {
    selectedLat.value = pos.latitude;
    selectedLng.value = pos.longitude;
  }

  Future<void> initSmsListener2() async {
    OTPInteractor()
        .getAppSignature()
        .then((value) => print('signature - $value'));

    codeController2 = OTPTextEditController(
      codeLength: 6,
      onCodeReceive: (code) {
        print('Your Application receive code - $code');
        print('Your Application receive code 2 - ${codeController2.text}');
      },
    )..startListenUserConsent(
        (code) {
          final exp = RegExp(r'(\d{6})');
          return exp.stringMatch(code ?? '') ?? '';
        },
        // strategies: [
        //   SampleStrategy(),
        // ],
      );

    print(codeController2.text);
  }

  Future<void> getImageAndroid13(ImageSource imageSource, String type) async {
    // Reset state (do NOT recreate the observables)
    selectedImagePath.value = '';
    selectedImageSize.value = '';
    compressImagePath.value = '';
    compressImageSize.value = '';

    try {
      final XFile? pickedFile =
          await ImagePicker().pickImage(source: imageSource);

      if (pickedFile == null) {
        Get.snackbar(
          'Error',
          'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      // Original file info
      selectedImagePath.value = pickedFile.path;
      selectedImageSize.value =
          ((await pickedFile.length()) / (1024 * 1024)).toStringAsFixed(2) +
              ' Mb';

      // ---- Compress (no crop) ----
      final dir = Directory.systemTemp;
      final targetPath =
          '${dir.absolute.path}/${selectedImagePath.value.split('/').last}';

      final compressedFile = await FlutterImageCompress.compressAndGetFile(
        selectedImagePath.value,
        targetPath,
        quality: 100,
        keepExif: false,
        autoCorrectionAngle: true,
        rotate: 0,
      );

      // Use compressed if available, else fall back to original
      final File fileToUse =
          File(compressedFile?.path ?? selectedImagePath.value);

      compressImagePath.value = fileToUse.path;
      compressImageSize.value =
          (fileToUse.lengthSync() / (1024 * 1024)).toStringAsFixed(2) + ' Mb';

      // Encode to base64
      final List<int> bytes = await fileToUse.readAsBytes();
      final String b64 = base64Encode(bytes);

      // ---- Route by type & upload ----
      switch (type) {
        case 'trade_front':
          tradeImageFrontFile.value = fileToUse;
          tradeImageFrontString.value = b64;

          //  saveImage(tradeImageFrontString.value);
          break;

        case 'nid_front':
          nidFile.value = fileToUse;
          nidString.value = b64;

          //   saveImage(nidString.value);
          break;
        case 'shop':
          shopImage.value = fileToUse;
          shopImageString.value = b64;

          //   saveImage(nidString.value);
          break;

        default:
          // Unknown type: still store the file to avoid silent loss
          Get.snackbar(
            'Notice',
            'Unknown image type "$type". Image picked and compressed, but not uploaded.',
            snackPosition: SnackPosition.BOTTOM,
          );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void submitRegistration(isDSR) {
    isLoading.value = true;
    Map<String, String> data = {
      'name': shopNameController.value.text,
      'email': email.value.text,
      'phone': phoneNumber.value.text,
      'address': addressController.value.text,
      'password': passWord.value.text,
      'district_id': "1",
      'upozela_id': "1",
      'area_id': "1",
      'latitude':
          Get.find<LocationService>().currentLocation.value['lat'].toString(),
      'longitude':
          Get.find<LocationService>().currentLocation.value['lng'].toString(),
      'fcm_token': "ghfhf",
      'app_token': "fhfghfgh",
      'user_type': "shop",
      'created_by': Get.find<AuthService>().currentUser.value.user == null
          ? '1'
          : Get.find<AuthService>().currentUser.value.user!.id.toString(),
    };

    AuthRepository().userRegistration(data).then((resp) {
      print('this is resp $resp');

      if (resp['status'] == 'success') {

        if (tradeImageFrontString.value.isNotEmpty) {
          saveImage(
              id: resp['user']['user_id'].toString(),
              image: tradeImageFrontString.value,
              type: 'trade_front');
        }
        if (nidString.value.isNotEmpty) {
          saveImage(
              id: resp['user']['user_id'].toString(),
              image: tradeImageFrontString.value,
              type: 'nid_front');
        }
        if (shopImageString.value.isNotEmpty) {
          saveImage(
              id: resp['user']['user_id'].toString(),
              image: shopImageString.value,
              type: 'shop');
        }
        if (isDSR == true) {
          Get.toNamed(Routes.SUCCESS_SHOP_REGISTER);



          getShopByDsr(
              Get.find<AuthService>().currentUser.value.user!.id.toString());
        } else {
          Get.toNamed(Routes.SPLASHSCREEN);
        }

        Get.snackbar(
          'Success',
          resp['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Please check form carefully.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    });
  }

  void saveImage({
    image,
    id,
    type,
  }) {
    print("image is $image");

    AuthRepository()
        .uplaodDocImage(userID: id, type: type, image: image)
        .then((resp) {
      print('this is resp $resp');

      if (resp['status'] == 'success') {
        Get.snackbar(
          'Success',
          resp['message'],
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'Please check form carefully.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    });
  }

  sendOTP() async {
    AuthRepository().otpSend(phoneNumber.value.text).then((resp) {
      Get.toNamed(Routes.VERIFYOTP);
    });
  }

  void getShopByDsr(id) {
    print("my res 121 is ++++++++");
    AuthRepository().getShopByDSR(id).then((resp) {
      print("my res 121 is $resp");
      GetShopByDsr model = GetShopByDsr.fromJson(resp);
      shopListByDSR.value = model.data!;
      print("length is ${shopListByDSR.value.length.toString()}");
    });
  }

  void getZone() {
    print("my res 121 is ++++++++");
    AuthRepository().getdistrictType().then((resp) {
      print("my res 121 is $resp");

      zoneList.value = resp;
      print("length is ${shopListByDSR.value.length.toString()}");
    });
  }

  void checkNumber() {
    print("my res 121 is ++++++++${phoneNumber.value.text}");
    AuthRepository().checkNumber(phoneNumber.value.text).then((resp) {
      print("my res 121454 is $resp");

      if (resp['exists'] == false) {
        Get.toNamed(Routes.PHONE_VERIFICATION_WTIH_O_T_P,
            arguments: [phoneNumber.value.text]);
      } else {
        Get.showSnackbar(Ui.ErrorSnackBar(
            message: "Number Already Exists", title: 'Error'.tr));
      }
    });
  }

  Future<void> initSmsListener() async {
    // final deviceInfo = DeviceInfoPlugin();
    // final androidInfo = await deviceInfo.androidInfo;
    // final isAndroid14OrHigher = androidInfo.version.sdkInt >= 34;

    try {
      // Request SMS permissions if not already granted

      // Fetch app signature
      final signature = await OTPInteractor().getAppSignature();
      print('signature - $signature');

      // Clear previous code
      codeController.value.clear();

      // Initialize OTPTextEditController
      final otpController = OTPTextEditController(
        codeLength: 6,
        onCodeReceive: (code) {
          print('Your Application received code - $code');
          print(
              'Your Application received code 2 - ${codeController.value.text}');
        },
      )..startListenUserConsent(
          (code) {
            final exp = RegExp(r'(\d{6})');
            codeController.value.addListener(() {
              newCode.value = exp.stringMatch(code ?? '') ?? '';
              codeController.value.text = newCode.value;
            });
            return exp.stringMatch(code ?? '') ?? '';
          },
        );

      codeController.value = otpController;
    } catch (e) {
      print("Error is $e");
    }

    // Check if Android version is 34 or higher
  }

  verifyOTP() async {
    Ui.customLoaderDialog();

    Get.toNamed(Routes.SHOP_INFO_REGISTER);
  }
}
