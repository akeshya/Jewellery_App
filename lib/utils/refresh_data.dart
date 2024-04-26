import 'package:get/get.dart';
import 'package:shopping_cart/controllers/GetControllers/product_list_controller.dart';
import '../controllers/GetControllers/category_list_controller.dart';

Future<void> refreshProducts() async {
  final productListController = Get.find<ProductsListController>();
  await productListController.getProductList();
}

Future<void> refreshCategories() async {
  final categoryListController = Get.find<CategoryListController>();
  await categoryListController.getCategoriesList();
}