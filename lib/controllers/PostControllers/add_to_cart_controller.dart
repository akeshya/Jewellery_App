import 'package:get/get.dart';
import 'package:shopping_cart/controllers/PostControllers/post_api_controller.dart';
import 'package:shopping_cart/utils/app_constants.dart';
import 'package:shopping_cart/utils/get_storage.dart';
import '../../utils/api_constants.dart';

class AddToCartController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  
  Future<bool> addToCarts(int productId, int productQuantity, String productSize, double productWeight) async {
    final data = {
      'user_id': getString(Constants.USER_ID),
      'product_id': productId,
      'product_quantity': productQuantity,
      'product_size': productSize,
      'product_weight': productWeight
    };

    print(data);

    var addCartResponse = await Get.find<PostApiController>().postControllers(
        ApiConstants.baseUrl + ApiConstants.addCartEndPoint, data);

    if (addCartResponse.statusCode == 200) {
      return true;
    }
    return false;
  }
}