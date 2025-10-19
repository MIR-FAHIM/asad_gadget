import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:asad_gadget/app/models/buysell/customer_model.dart';

import 'settings_service.dart';

class AuthService extends GetxService {
  final currentUser = CustomerModel().obs;
  late GetStorage _box;
  final used = false.obs;
  final alreadyLogged = false.obs;
  final cartId = 0.obs;

  AuthService() {
    _box = GetStorage();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    _box = GetStorage();
    getLogged();
    getUsed();
    getCurrentUser();
    getCartId();
    super.onInit();
  }

  void setUser(CustomerModel customer) async {
    _box.write('current_user', customer.toJson());

    getCurrentUser();
  }

  void setFirstUseOrNot() async {
    _box.write('used', true);
    getUsed();
  }

  void setFirstLoggedOrNot() async {
    _box.write('alreadyLogged', true);
    getUsed();
  }
 void setCartId(data) async {
    _box.write('cart_id', data);
    getCartId();
  }

  getLogged() {
    if (_box.hasData('alreadyLogged')) {
      alreadyLogged.value = _box.read('alreadyLogged');
    }
  }
getCartId() {
    if (_box.hasData('cart_id')) {
      cartId.value = _box.read('cart_id');
    }else{
      cartId.value =0 ;
    }
  }


  Future getUsed() async {
    if (_box.hasData('used')) {
      used.value = await _box.read('used');
    }
  }

  Future getCurrentUser() async {
    if (_box.hasData('current_user')) {
      currentUser.value = CustomerModel.fromJson(await _box.read('current_user'));
    }
    print('customer data: ${currentUser.value.user!.name}');
  }

  Future removeCurrentUser() async {
    currentUser.value = CustomerModel();
    await _box.remove('alreadyLogged');
    await _box.remove('current_user');
    await _box.remove('cart_id');
  }

  Future removeCartId() async {

    await _box.remove('cart_id');
    getCartId();
  }

  bool get isAuth => currentUser.value.sessionToken == null ? false : true;
}
