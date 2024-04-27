import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/components/custom_toast.dart';
import 'package:shopping_cart/controllers/GetControllers/product_list_controller.dart';
import 'package:shopping_cart/controllers/PostControllers/favorites_controller.dart';
import 'package:shopping_cart/model/favorites_modal.dart';
import 'package:shopping_cart/utils/app_colors.dart';
import '../../components/common_components.dart';
import '../../controllers/PostControllers/add_delete_favorite_controller.dart';
import '../product_details_page.dart';

class WishlistFavoritesPage extends StatelessWidget {
  WishlistFavoritesPage({Key? key}) : super(key: key);

  final wishlistController = Get.put(WishlistFavoritesController());
  final productsController = Get.find<ProductsListController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      appBar: commonAppBar('My Favorites', context, null),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Obx(() =>
          Column(
            children: [
              Row(
                children: [
                  regularLightText('${Get.find<FavoritesController>().favoriteProducts.length} items',
                      color: Color(0xFF565D6D), fontSize: 12),
                ],
              ),
              SizedBox(height: 5),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: wishlistController.favoritesList.length,
                  controller: wishlistController.scrollController,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsPage(product: productsController.productsList
                                  .firstWhere(
                                      (product) =>
                                  product.id == wishlistController.favoritesList[index].productId
                                // orElse: () => Product(id: '', imageUrl: 'default_image_url'),
                              )))),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 4,
                        child:
                        Stack(
                          fit: StackFit.expand,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                image: CachedNetworkImageProvider(
                                    productsController.productsList
                                        .firstWhere(
                                            (product) =>
                                        product.id == wishlistController.favoritesList[index].productId
                                      // orElse: () => Product(id: '', imageUrl: 'default_image_url'),
                                    )
                                        .image[0],
                                  cacheKey: productsController.productsList
                                      .firstWhere(
                                          (product) =>
                                      product.id == wishlistController.favoritesList[index].productId
                                    // orElse: () => Product(id: '', imageUrl: 'default_image_url'),
                                  )
                                      .image[0],
                                    scale: MediaQuery.of(context).devicePixelRatio * 2
                                ),
                                fit: BoxFit.fill,
                                filterQuality: FilterQuality.high,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: GestureDetector(
                                onTap: () async{
                                  String favoriteStatus = await Get.find<AddFavoriteController>().addFavorites(wishlistController.favoritesList[index].productId);

                                  // print(Get.find<FavoritesController>().favoriteProducts.any((element) => element.productId.toString() == product.id.toString()));
                                  if(favoriteStatus != '') {
                                    if(favoriteStatus == 'Favorite Added') {
                                      Toast.success('Product added to favorite products');
                                    }
                                    if(favoriteStatus == 'Favorite Deleted') {
                                      Toast.error('Product removed from favorite products');
                                      wishlistController.favoritesList.removeAt(index);
                                      wishlistController.loadMoreCount -= 1;
                                    }
                                    await Get.find<FavoritesController>().getFavoriteProducts();
                                  }
                                },
                                child: Obx(() =>
                                    Icon(
                                      Icons.favorite,
                                      color: Get.find<FavoritesController>().favoriteProducts.any((element) => element.productId == wishlistController.favoritesList[index].productId) ? AppColors.primaryColor500 : Colors.grey,
                                    ),
                                ),
                              ),
                            ),

                          ],
                        )
                      ),
                    );
                  },
                ),
              ),
              wishlistController.isLoading.isTrue
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          backgroundColor: Color(0xFFCC7B25)),
                      onPressed: () {
                        wishlistController.loadMoreItems();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: regularDarkText("View More",
                            color: Colors.white, fontSize: 16),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class WishlistFavoritesController extends GetxController {
  final ScrollController scrollController = ScrollController();
  RxInt loadMoreCount = 0.obs; // Number of items to load when "View More" is pressed
  RxBool isLoading = false.obs;

  List<Favorite> favoritesList = <Favorite>[].obs;

  final favoriteController = Get.find<FavoritesController>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadMoreItems();
    scrollController.addListener(scrollListener);
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    scrollController.dispose();
    super.dispose();
  }

  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      // User has scrolled to the bottom of the list
      loadMoreItems();
    }
  }

  void loadMoreItems() async {
      // Generate additional random items and add them to the existing list
      if(loadMoreCount.value == favoriteController.favoriteProducts.length && favoriteController.favoriteProducts.isNotEmpty) {
        Toast.error('No more items');
      }
      else if(favoriteController.favoriteProducts.isNotEmpty) {
        if (isLoading.value == false) {
          isLoading.value = true;

          // Simulate loading data from an API or other source
          await Future.delayed(Duration(seconds: 1));
        if(favoriteController.favoriteProducts.length - loadMoreCount.value >= 10) {
          List<Favorite> newItems = generateFavoritesList(10);
          favoritesList.addAll(newItems);
          loadMoreCount.value += 10;
        } else {
          List<Favorite> newItems = generateFavoritesList(favoriteController.favoriteProducts.length - loadMoreCount.value + loadMoreCount.value);
          favoritesList.addAll(newItems);
          loadMoreCount.value += favoriteController.favoriteProducts.length - loadMoreCount.value;
        }
        isLoading.value = false;
      }
    }
  }

  List<Favorite> generateFavoritesList(int lastIndex) {
    print(loadMoreCount.value);
    print(lastIndex);
    return favoriteController.favoriteProducts.sublist(loadMoreCount.value, lastIndex);
  }
}
