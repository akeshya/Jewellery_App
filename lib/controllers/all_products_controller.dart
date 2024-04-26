import 'package:get/get.dart';
import 'package:shopping_cart/controllers/GetControllers/product_list_controller.dart';
import '../model/product_list_modal.dart';

class AllProductsController extends GetxController {

  final productsController = Get.find<ProductsListController>();

  RxList<Product> allNewArrivalProducts = <Product>[].obs;
  RxList<Product> allProducts = <Product>[].obs;

  RxBool isLoadingNewArrivals = true.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getAllProducts(String how) async {
    productsController.getProductList();
    if(how == 'Products') {
      allProducts.value = productsController.productsList;
    }
    else if(how == 'New Arrivals') {
      isLoadingNewArrivals.value = true;
      List<Product> tempList = [];
      for(var product in productsController.productsList) {
        if(product.cname == 'New Arrivals') {
          tempList.add(product);
        }
      }
      allNewArrivalProducts.value = tempList;
      isLoadingNewArrivals.value = false;
    }
  }
}