import 'dart:convert';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/PostControllers/post_api_controller.dart';
import 'package:shopping_cart/model/favorites_modal.dart';
import 'package:shopping_cart/utils/app_constants.dart';
import 'package:shopping_cart/utils/get_storage.dart';
import '../../utils/api_constants.dart';

class FavoritesController extends GetxController {
  var favoriteProducts = <Favorite>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFavoriteProducts();
  }

  Future<void> getFavoriteProducts() async {
    final data = {'user_id': getString(Constants.USER_ID)};

    var favoritesResponse = await Get.find<PostApiController>().postControllers(
        ApiConstants.baseUrl + ApiConstants.favoritesEndPoint, data);

    if (favoritesResponse.statusCode == 200) {
      if (favoritesResponse.data != null) {
        print(favoritesResponse.data);
          final favoriteModal =
              favoriteModalFromJson(json.encode(favoritesResponse.data));

          favoriteProducts.value = favoriteModal.data;
      }
    }
  }
}