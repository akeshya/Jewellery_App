import 'dart:convert';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/GetControllers/get_api_controller.dart';
import 'package:shopping_cart/utils/api_constants.dart';
import '../../model/product_list_modal.dart';

class ProductsListController extends GetxController {
  RxBool loadingProducts = true.obs;

  List<Product> productsList = <Product>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProductList();
  }

  Future<void> getProductList() async {
    productsList.clear();
    loadingProducts.value = true;
    try {
      var responseData = await Get.find<GetApiController>()
          .getControllers(ApiConstants.baseUrl + ApiConstants.productsEndpoint);

      if (responseData.statusCode == 200) {
        final productListModal =
            productListModalFromJson(json.encode(responseData.data));

        print('product list data is: $productListModal');

        productsList = productListModal.data;
        print(productsList.length);
      }
    } catch (e) {
      print('errors in get product list data iss::::: $e');
    }
    loadingProducts.value = false;
  }
}