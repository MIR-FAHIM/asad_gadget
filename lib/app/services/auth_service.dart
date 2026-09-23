import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  late GetStorage _box;
  final used = true.obs;
  final alreadyLogged = false.obs;
  final cartId = 0.obs;

  AuthService() {
    _box = GetStorage();
  }

  @override
  void onInit() {
    super.onInit();
    _box = GetStorage();
    getLogged();
    getUsed();
  }

  void getLogged() {
    if (_box.hasData('alreadyLogged')) {
      alreadyLogged.value = _box.read('alreadyLogged') ?? false;
    }
  }

  void getUsed() {
    if (_box.hasData('used')) {
      used.value = _box.read('used') ?? true;
    }
  }

  bool get isAuth => alreadyLogged.value;
}
