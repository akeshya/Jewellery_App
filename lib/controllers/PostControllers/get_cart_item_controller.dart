import 'dart:convert';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/PostControllers/post_api_controller.dart';
import 'package:shopping_cart/model/cart_modal.dart';
import 'package:shopping_cart/utils/app_constants.dart';
import 'package:shopping_cart/utils/get_storage.dart';
import '../../utils/api_constants.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;

  RxDouble totalWeight = 0.0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCartItems();
  }

  Future<void> getCartItems() async {
    totalWeight.value = 0;
    final data = {'user_id': getString(Constants.USER_ID)};

    var cartResponse = await Get.find<PostApiController>().postControllers(
        ApiConstants.baseUrl + ApiConstants.getCartEndPoint, data);

    if (cartResponse.statusCode == 200) {
      if(cartResponse.data != null) {
        if(cartResponse.data['status']) {
          final getCartModal = getCartModalFromJson(
              json.encode(cartResponse.data));
          cartItems.value = getCartModal.data;
          calculateTotalWeight();
        }
        if(cartResponse.data['message'] == 'Cart Item does not exist') {
          cartItems.value = [];
        }
      }
    }
  }

  calculateTotalWeight() {
    print('calc weight');

    cartItems.forEach((element) => {
      print(element.productWeight),
      totalWeight.value = totalWeight.value + element.productWeight,
      print(totalWeight.value)
    });
  }
}