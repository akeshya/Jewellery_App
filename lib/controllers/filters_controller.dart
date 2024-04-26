import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controllers/sub_category_list_controller.dart';

import 'GetControllers/product_list_controller.dart';
import 'PostControllers/get_sub_category_list_controller.dart';

class FiltersController extends GetxController {
  final ProductsListController productsListController =
  Get.find<ProductsListController>();
  final getSubCategoryController = Get.find<GetSubCategoryListController>();
  final subCategoryController = Get.find<SubCategoryListController>();

  RxList<dynamic> filteredProductList = <dynamic>[].obs;
  RxList<dynamic> categoryProductList = <dynamic>[].obs;

  Future<void> getProductsList(String categoryId) async {
    categoryProductList.value = [];
    filteredProductList.value = [];
    productsListController.productsList.forEach((element) {
      if (element.catagoryId.toString() == categoryId &&
          element.subName != '') {
        if(element.productsize[0].productWeight > maxWeight.value)
          {
            maxWeight.value = element.productsize[0].productWeight + 10;
          }

        if(double.parse(element.productsize[0].size) > maxSize.value) {
          maxSize.value = double.parse(element.productsize[0].size) + 10;
        }

        categoryProductList.add(element);
        filteredProductList.add(element);
        if (!getSubCategoryController.categorySubCategoryList.contains(element.subName)) {
          getSubCategoryController.categorySubCategoryList.add(element.subName);
        }
      }
    });
    getInitialFilters();
  }

  RxBool applyFilters = false.obs;
  RxBool filtersApplied = false.obs;

  RxDouble minWeight = 0.0.obs;
  RxDouble maxWeight = 1.0.obs;

  RxDouble minSize = 0.0.obs;
  RxDouble maxSize = 1.0.obs;

  var weightRange = RangeValues(0, 1).obs;
  var sizeRange = RangeValues(0, 1).obs;

  RxBool weightLowToHigh = false.obs;
  RxBool sizeLowToHigh = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getInitialFilters();
  }

  Future<void> getInitialFilters() async {
    applyFilters.value = false;
    filtersApplied.value = false;

    weightRange.value = RangeValues(minWeight.value, maxWeight.value);

    sizeRange.value = RangeValues(minSize.value, maxSize.value);

    weightLowToHigh.value = false;
    sizeLowToHigh.value = false;
  }

  Future<void> updateWeightRange(double min, double max) async {
    weightRange.value = RangeValues(min, max);
  }

  Future<void> updateSizeRange(int min, int max) async {
    sizeRange.value = RangeValues(min.toDouble(), max.toDouble());
  }
}