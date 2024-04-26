import 'dart:convert';

import 'package:get/get.dart';
import 'package:shopping_cart/controllers/PostControllers/post_api_controller.dart';
import 'package:shopping_cart/utils/api_constants.dart';
import '../../model/get_sub_category_list_modal.dart';

class GetSubCategoryListController extends GetxController {
  RxBool loadingGetSubCategories = true.obs;

  RxBool isLoadingSubCategories = false.obs;

  RxList<String> categorySubCategoryList = <String>[].obs;

  @override
  void onInit() {
// TODO: implement onInit
    super.onInit();
  }

  Future<void> getGetSubCategoriesList(String categoryId) async {
    categorySubCategoryList.value = [];
    loadingGetSubCategories.value = true;

    final data = {'category_id': categoryId};

    print(data);

    try {
      var responseData = await Get.find<PostApiController>().postControllers(
          ApiConstants.baseUrl + ApiConstants.getSubCategoriesEndpoint, data);
      print('get get sub category list data is: $responseData');

      if (responseData.statusCode == 200) {
        final getSubCategoryModal =
            getSubCategoryModalFromJson(json.encode(responseData.data));

        if (getSubCategoryModal.status) {
          categorySubCategoryList.value =
              getSubCategoryModal.data.map((element) => element.name).toList();

          categorySubCategoryList.sort();
          categorySubCategoryList.insert(0, 'All');
        }
      }
    } catch (e) {
      print('errors in get get sub category category list data iss::::: $e');
    }
    loadingGetSubCategories.value = false;
  }
}