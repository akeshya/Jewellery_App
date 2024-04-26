import 'dart:convert';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/GetControllers/get_api_controller.dart';
import 'package:shopping_cart/utils/api_constants.dart';
import '../../model/category_list_modal.dart';

class CategoryListController extends GetxController {

  RxBool isLoadingCategories = true.obs;
  List<Category> categoriesList = <Category>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategoriesList();
  }

  Future<void> getCategoriesList() async {
    categoriesList.clear();
    isLoadingCategories.value = true;
    try {
      var responseData = await Get.find<GetApiController>()
          .getControllers(ApiConstants.baseUrl + ApiConstants.categoriesEndpoint);

      if (responseData.statusCode == 200) {
        final categoryListModal = categoryListModalFromJson(json.encode(responseData.data));

        print('category list data is: $categoryListModal');

        categoriesList = categoryListModal.data;
      }
    } catch (e) {
      print('errors in get product category list data iss::::: $e');
    }
    isLoadingCategories.value = false;
  }
}