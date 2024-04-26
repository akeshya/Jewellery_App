import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/components/categories_components.dart';
import 'package:shopping_cart/components/common_components.dart';
import 'package:shopping_cart/components/flicker_animation_loader.dart';
import 'package:shopping_cart/controllers/GetControllers/category_list_controller.dart';
import '../../controllers/PostControllers/get_sub_category_list_controller.dart';
import '../../utils/CustomColors.dart';
import '../../utils/refresh_data.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);

  final categoryListController = Get.find<CategoryListController>();

  Future<List<Object>> fetchSuggestions(String query) async {
    // Ensure that categoryListController.categoriesList is not null
    final List<Object> filteredCategories = [];

    // Filter categories whose cname contains the query
    for (var category in categoryListController.categoriesList) {
      if (category.cname.toLowerCase().contains(query.toLowerCase())) {
        if (category.cname != 'New Arrivals') {
          filteredCategories.add(category);
        }
      }
    }

    return filteredCategories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar('Categories', null, null),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refreshCategories,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                /*Search Section*/
                SizedBox(
                  height: 54,
                  child: commonSearchBar(
                      context, 'categories', 'Search Categories',
                      (query) async {
                    return fetchSuggestions(query);
                  }, 20, CustomColors.COLOR_PRIMARY_500, Colors.white),
                ),
                SizedBox(height: 10),
                Expanded(child: categoryItemsList(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categoryItemsList(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Obx(
      () => ListView.builder(
          itemCount: categoryListController.isLoadingCategories.isTrue
              ? 10
              : categoryListController.categoriesList.length,
          itemBuilder: (BuildContext context, int index) {
            return categoryListController.isLoadingCategories.isTrue
                ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: FlickeringLoadingWidget(Colors.grey),
                )
                :  GestureDetector(
                onTap: () async {
                  await Get.find<GetSubCategoryListController>().getGetSubCategoriesList(categoryListController.categoriesList[index].id.toString());
                  Get.toNamed('/product_listing',
                      arguments: {'category': categoryListController.categoriesList[index]});
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0),
                  child: categoryItem(
                      categoryListController.categoriesList[index].cname, width),
                ));
          }),
    );
  }
}
