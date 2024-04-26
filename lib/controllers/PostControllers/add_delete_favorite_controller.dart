import 'package:get/get.dart';
import 'package:shopping_cart/controllers/PostControllers/post_api_controller.dart';
import 'package:shopping_cart/utils/app_constants.dart';
import '../../utils/api_constants.dart';
import '../../utils/get_storage.dart';

class AddFavoriteController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<String> addFavorites(int productId) async {
    String? userId = getString(Constants.USER_ID);
    final data = {
      'user_id': userId,
      'product_id': productId
    };

    print(data);

    var addFavoriteResponse = await Get.find<PostApiController>().postControllers(
        ApiConstants.baseUrl + ApiConstants.addFavoriteEndPoint, data);

    if (addFavoriteResponse.statusCode == 200) {
      if(addFavoriteResponse.statusMessage == 'OK') {
        if(addFavoriteResponse.data != '') {
          return addFavoriteResponse.data['message'];
        }
      }
    }
    return '';
  }
}