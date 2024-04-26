import 'dart:convert';
import 'package:get/get.dart';
import 'package:shopping_cart/model/sub_category_list_modal.dart';
import '../utils/api_constants.dart';
import 'GetControllers/get_api_controller.dart';

class SubCategoryListController extends GetxController {
  RxBool isLoadingSubCategories = true.obs;
  List<SubCategory> subCategoriesList = <SubCategory>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getSubCategoriesList();
  }

  Future<void> getSubCategoriesList() async {
    subCategoriesList.clear();
    isLoadingSubCategories.value = true;
    try {
      var responseData = await Get.find<GetApiController>().getControllers(
          ApiConstants.baseUrl + ApiConstants.allSubCategoriesEndPoint);

      if (responseData.statusCode == 200) {
        final subCategoryListModal =
            subCategoryListModalFromJson(json.encode(responseData.data));

        print('sub category list data is: $subCategoryListModal');

        subCategoriesList = subCategoryListModal.data;
      }
    } catch (e) {
      print('errors in sub category list data iss::::: $e');
    }
    isLoadingSubCategories.value = false;
  }
}
