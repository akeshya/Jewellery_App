import 'dart:convert';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/PostControllers/post_api_controller.dart';
import '../../model/search_product_modal.dart';
import '../../utils/api_constants.dart';

class SearchProductsController extends GetxController {

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<List<SearchItem>> searchProducts(String searchTerm) async {
    final data = {'name': searchTerm};

    var searchResponse = await Get.find<PostApiController>().postControllers(
        ApiConstants.baseUrl + ApiConstants.searchProductsEndPoint, data);

    print('search statuscode: ${searchResponse.statusCode}');

    if (searchResponse.statusCode == 200) {
      if(searchResponse.data != null) {
        if(searchResponse.data['status']) {
              final searchProductModal = searchProductModalFromJson(json.encode(searchResponse.data));
           return searchProductModal.data;
        }
        else {
          return [];
        }
      }
    }

    return [];
  }
}