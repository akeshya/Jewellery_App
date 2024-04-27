import 'package:get/get.dart';
import 'package:shopping_cart/components/custom_toast.dart';
import 'package:shopping_cart/controllers/PostControllers/post_api_controller.dart';
import 'package:shopping_cart/utils/app_constants.dart';
import 'package:shopping_cart/utils/get_storage.dart';
import '../../utils/api_constants.dart';

class PlaceOrderController extends GetxController {

  RxBool isOrderPlaced = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> placeOrder() async {
    final data = {
      'user_id': getString(Constants.USER_ID),
    };

    print(data);

    try {
      var placeOrderResponse = await Get.find<PostApiController>().postControllers(
          ApiConstants.baseUrl + ApiConstants.placeOrderEndPoint, data);

      if (placeOrderResponse.statusCode == 200) {
        if(placeOrderResponse.statusMessage == 'OK') {
          if(placeOrderResponse.data['status']) {
            isOrderPlaced.value = true;
          }
          else {
            isOrderPlaced.value = false;
            Toast.error(placeOrderResponse.data['message']);
          }
        }
      }
    } catch(e) {
      isOrderPlaced.value = false;
      print('error in order place');
    }
  }
}