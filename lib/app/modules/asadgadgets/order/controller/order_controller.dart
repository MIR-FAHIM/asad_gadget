import 'package:asad_gadget/app/models/asad_gadget/cart_item_model.dart';
import 'package:asad_gadget/app/models/asad_gadget/get_order_model.dart';
import 'package:asad_gadget/app/models/asad_gadget/shop_list_model.dart';
import 'package:asad_gadget/app/repositories/product_repository.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/app/services/auth_service.dart';
import 'package:asad_gadget/common/ui.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart'; // For GlobalKey<FormState>

class OrderController extends GetxController {
  // GlobalKey for the form, used for validation
  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  // RxString for text input fields
  var totalAmount = 0.0.obs;
  var orderTotalAmount = '0.0'.obs;
  var orderStatus = ''.obs;
  var currentCartId = 0.obs;
  var productNameController = TextEditingController().obs;
  var modelController = TextEditingController().obs;
  var quantityController = TextEditingController().obs;
  var priceController = TextEditingController().obs;
  var notesController = TextEditingController().obs;
  final cartItemList = <Item>[].obs;
  final orderList = <OrderData>[].obs;
  final shopList = <DatumShop>[].obs;

  var address = ''.obs;
  var orderID = ''.obs;
  var orderDate = ''.obs;
  var mobileNumber = ''.obs;
  var tradeLicensePath = ''.obs; // To store path/URL of uploaded trade license
  var nidCardPath = ''.obs; // To store path/URL of uploaded NID card
  var areaZone = ''.obs;
  var visitDay = ''.obs; // For selected visit day
  var shopLocationUrl = ''.obs; // To store the Google Maps URL
  var shopImagePath = ''.obs; // To store path/URL of uploaded shop image
  // Loading indicator for submission
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getAllOrder();
    getShopList();
    if (Get.find<AuthService>().cartId.value == 0) {
      print("i am here_______");
      addCart();
    }
  }

  void _updateItemTotal() {
    try {
      final quantity = int.tryParse(quantityController.value.text) ?? 0;
      final price = double.tryParse(priceController.value.text) ?? 0.0;
      // This function is primarily for internal calculation if needed,
      // the actual item total is calculated when adding to orderItems.
      // You might not need to store this if only adding to orderItems.
    } catch (e) {
      print('Error parsing quantity or price: $e');
    }
  }

  addCart() {
    Map data = {
      "user_id": Get.find<AuthService>().currentUser.value.user!.id.toString(),
      "shop_id": '2'
    };

    ProductRepository().addCart(data).then((resp) {
      if (resp['status'] == 'success') {
        currentCartId.value = resp['cart_id'];
        Get.find<AuthService>().setCartId(currentCartId.value);
      }
    });
  }

  getCartItemByCartId() {
    ProductRepository()
        .getCartItemByCartId(Get.find<AuthService>().cartId.value)
        .then((resp) {
      if (resp['status'] == 'success') {
        GetCartItemModel model = GetCartItemModel.fromJson(resp);
        cartItemList.value = model.items!;
        totalAmount.value = model.getTotalCartPrice();
      }
    });
  }

  getCartItemByOrder(id) {
    ProductRepository().getCartItemByCartId(id.toString()).then((resp) {
      if (resp['status'] == 'success') {
        GetCartItemModel model = GetCartItemModel.fromJson(resp);
        cartItemList.value = model.items!;
        totalAmount.value = model.getTotalCartPrice();

        Get.toNamed(Routes.ORDERDETAILS);
      }
    });
  }

  getAllOrder() {
    ProductRepository()
        .getAllOrder(
            Get.find<AuthService>().currentUser.value.user!.id.toString())
        .then((resp) {
      print("my allorders are $resp");
      if (resp['status'] == 'success') {
        GetOrderModel model = GetOrderModel.fromJson(resp);
        orderList.value = model.orders!;
      }
    });
  }

  getShopList() {
    ProductRepository().getShopList().then((resp) {
      print("all shop are $resp");
      if (resp['status'] == 'success') {
        GetShopListModel model = GetShopListModel.fromJson(resp);
        shopList.value = model.data!;
      }
    });
  }

  deleteCartItem(id) {
    ProductRepository().deleteCartItem(id.toString()).then((resp) {
      print("delete id $id ++++++++++++++++ $resp");
      if (resp['status'] == 'success') {
        Get.showSnackbar(Ui.SuccessSnackBar(
            message: 'Cart Item Deleted.', title: 'Success'.tr));
      }
      getCartItemByCartId();
    });
  }

  markDeliver(id) {
    ProductRepository().markDeliver(id.toString()).then((resp) {
      print("mark deliver id $id ++++++++++++++++ $resp");
      if (resp['status'] == 'success') {
        getAllOrder();
        Get.toNamed(Routes.DELIVER_SUCCESS);
        Get.showSnackbar(
            Ui.SuccessSnackBar(message: resp['message'], title: 'Success'.tr));
      }
    });
  }

  void submitOrder() {
    Map data = {
      "cart_id": Get.find<AuthService>().cartId.value.toString(),
      "user_id": Get.find<AuthService>().currentUser.value.user!.id.toString(),
      "note": notesController.value.text,
      "shop_id": '2',
      "total_product":
          Get.find<OrderController>().cartItemList.length.toString(),
      "total_amount": totalAmount.value.toString(),
    };

    ProductRepository().addOrder(data).then((resp) {
      if (resp['status'] == 'success') {
        Get.find<AuthService>().removeCartId();
        Get.toNamed(Routes.ORDERSUCCESS);
        Get.showSnackbar(
            Ui.SuccessSnackBar(message: resp['message'], title: 'Success'.tr));
      }
    });

    clearOrder();
  }

  void cartUpdate(id, quantity, price) {
    Map data = {
      "quantity": quantity.toString(),
      "cart_price": price,
    };

    ProductRepository().updateCart(id.toString(), data).then((resp) {
      if (resp['status'] == 'success') {
        getCartItemByCartId();
      }
    });

    // Optionally, clear the order after submission
    clearOrder();
  }

  // Function to clear all items and reset the order form
  void clearOrder() {
    totalAmount.value = 0.0;
    productNameController.value.clear();
    modelController.value.clear();
    quantityController.value.text = '1';
    priceController.value.clear();
    notesController.value.clear();
  }
}
