import 'package:asad_gadget/app/models/asad_gadget/get_products_model.dart';
import 'package:asad_gadget/app/modules/asadgadgets/order/controller/order_controller.dart';
import 'package:asad_gadget/app/repositories/product_repository.dart';
import 'package:asad_gadget/app/routes/app_pages.dart';
import 'package:asad_gadget/app/services/auth_service.dart';
import 'package:asad_gadget/common/Color.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductController extends GetxController {
  final GlobalKey<FormState> registrationFormKey = GlobalKey<FormState>();
  var totalAmount = 0.0.obs;
  var productNameController = TextEditingController().obs;
  var modelController = TextEditingController().obs;
  var quantityController = TextEditingController().obs;
  var priceController = TextEditingController().obs;
  final products = <DatumProducts>[].obs;
  final filterProducts = <DatumProducts>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getProductController();
    // Simulate fetching products
  }

  filteredProductController(data) {
    filterProducts.value = data.isEmpty || data == null || data == ''
        ? products.value
        : products.value
            .where((e) =>
                e.name.toLowerCase().contains(data.toString().toLowerCase()))
            .toList();

    print('filtered products length is ${filterProducts.value.length}');
  }

  void getProductController() async {
    ProductRepository().getProduct().then((resp) {
      print("resp is $resp");
      if (resp['status'] == 'success') {
        try {
          print('i am here 5656');
          GetProductsModel model = GetProductsModel.fromJson(resp);
          print('i am here>>>>>>>>>');
          products.value = model.data!;
          print('i am here>>>>>>>>>${products.value.length}');
          filteredProductController('');
        } catch (e) {
          print("error is $e");
        }
      } else {}
    }).catchError((onError) {});
  }

  void goToCart() async {
    Get.put(OrderController());
    Get.find<OrderController>().getCartItemByCartId();
    Get.toNamed(Routes.CARTVIEW);
  }

  void addToCart(DatumProducts product) {
    Map data = {
      "cart_id": Get.find<AuthService>().cartId.value.toString(),
      "product_id": product.id.toString(),
      "quantity": '1',
      "cart_price": product.productPrice.toString(),
      "shop_id": '2',
    };

    ProductRepository().addCartItem(data).then((resp) {
      if (resp['status'] == 'success') {
        Get.snackbar(
          'Added to Cart',
          '${product.name} added to your cart!',
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 1),
          backgroundColor: AppColors.primaryColor,
          colorText: AppColors.homeTextColor1,
        );
      }
    });
  }
}
