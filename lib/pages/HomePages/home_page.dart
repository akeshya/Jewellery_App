import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/components/common_components.dart';
import 'package:shopping_cart/components/custom_toast.dart';
import 'package:shopping_cart/components/flicker_animation_loader.dart';
import 'package:shopping_cart/components/reusable_card_with_image.dart';
import 'package:shopping_cart/controllers/GetControllers/category_list_controller.dart';
import 'package:shopping_cart/controllers/GetControllers/product_list_controller.dart';
import 'package:shopping_cart/controllers/PostControllers/search_product_controller.dart';
import 'package:shopping_cart/utils/CustomColors.dart';
import 'package:shopping_cart/utils/CustomTextStyle.dart';
import 'package:shopping_cart/utils/app_images.dart';
import 'package:shopping_cart/utils/refresh_data.dart';
import '../../controllers/PostControllers/add_delete_favorite_controller.dart';
import '../../controllers/PostControllers/favorites_controller.dart';
import '../../utils/app_colors.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final productsController = Get.find<ProductsListController>();
  final categoryListController = Get.find<CategoryListController>();

  Future<List<Object>> fetchSuggestions(String query) async {
    print('query is: $query');
    final searchProductsController = Get.find<SearchProductsController>();

    // Ensure that searchProductsController.searchProducts returns a non-null value
    var searchResults = await searchProductsController.searchProducts(query);

    print('search result: $searchResults');

    return searchResults;
  }

  var headingStyle = CustomTextStyle.textFormFieldRegular.copyWith(
    color: CustomColors.COLOR_PRIMARY_500,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    fontFamily: 'LatoMed',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: refreshProducts,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            child: Column(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        foregroundImage: AssetImage(AppImages.appIcon),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Welcome to,",
                        textAlign: TextAlign.left,
                        style: headingStyle.copyWith(
                            fontWeight: FontWeight.normal,
                            fontFamily: 'LatoReg')),
                    SizedBox(
                      height: 8,
                    ),
                    Text("Shree South India Jewellers", style: headingStyle),
                    SizedBox(
                      height: 30,
                    ),
                    /*Search Section*/
                    SizedBox(
                      height: 54,
                      child: commonSearchBar(context, 'universal', 'Search',
                          (query) async {
                        return fetchSuggestions(query);
                      }, 27, CustomColors.COLOR_PRIMARY_500, Colors.white),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Expanded(child: newArrivals(context)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget newArrivals(BuildContext context) {
    // if (productsController.loadingProducts.isFalse) {
    //   for (var product in productsController.productsList) {
    //     if (product.cname == 'New Arrivals') {
    //       allNewArrivalProducts.add(product);
    //     }
    //   }
    // }

    var height = MediaQuery.of(context).size.height;

    return Obx(
      () => GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns
              crossAxisSpacing: 5.0, // Spacing between columns
              mainAxisSpacing: 5.0, // Spacing between rows
              childAspectRatio: 0.95),
          itemCount: productsController.loadingProducts.isTrue
              ? 6
              : productsController.productsList.length,
          itemBuilder: (BuildContext context, int index) {
            return productsController.loadingProducts.isTrue
                ? FlickeringLoadingWidget(Colors.grey)
                : GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/product_details',
                          arguments: productsController.productsList[index]);
                    },
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            ReusableCardWithImage(
                                imageUrl: productsController
                                    .productsList[index].image[0],
                                height: height * 0.2,
                                borderRadius: 10),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: GestureDetector(
                                onTap: () async {
                                  String favoriteStatus =
                                      await Get.find<AddFavoriteController>()
                                          .addFavorites(productsController
                                              .productsList[index].id);
                                  print(favoriteStatus);
                                  if (favoriteStatus != '') {
                                    if (favoriteStatus == 'Favorite Added' ||
                                        favoriteStatus ==
                                            'Product added to favorites') {
                                      Toast.success('${productsController.productsList[index].name} added to favorite products');
                                    }
                                    if (favoriteStatus == 'Favorite Deleted') {
                                     Toast.error('${productsController.productsList[index].name} removed from favorite products');
                                    }
                                    await Get.find<FavoritesController>()
                                        .getFavoriteProducts();
                                  }
                                },
                                child: Obx(
                                  () => Icon(
                                    Icons.favorite,
                                    color: Get.find<FavoritesController>()
                                            .favoriteProducts
                                            .any((element) =>
                                                element.productId ==
                                                productsController
                                                    .productsList[index].id)
                                        ? AppColors.primaryColor500
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: regularDarkText(
                              productsController.productsList[index].name),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: regularDarkText(
                              '${productsController.productsList[index].productsize.reduce((currentMin, product) => product.productWeight < currentMin.productWeight ? product : currentMin).productWeight.toStringAsFixed(2)} grams'),
                        ),
                      ],
                    ),
                  );
          }),
    );
  }
}
