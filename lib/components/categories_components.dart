import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/components/custom_toast.dart';
import 'package:shopping_cart/controllers/PostControllers/add_delete_favorite_controller.dart';
import 'package:shopping_cart/controllers/PostControllers/favorites_controller.dart';
import 'package:shopping_cart/utils/CustomColors.dart';
import 'package:shopping_cart/utils/app_colors.dart';
import 'package:shopping_cart/utils/app_images.dart';

Widget categoryItem(String categoryName, double width) {
  return Container(
    height: 110,
    child: Stack(
      children: [
        Image.asset(
          AppImages.categoryBackImage,
          fit: BoxFit.fill,
          width: width,
          height: 110,
        ),
        Center(
          child: Text(
            categoryName,
            style: TextStyle(
              fontFamily: 'LatoMed',
              color: AppColors.primaryColor, // Customize text color
              fontSize: 20, // Customize text size
              fontWeight: FontWeight.w700, // Customize text style
            ),
          ),
        ),
      ],
    ),
  );
}

Widget categoryProductItem(BuildContext context, dynamic product) {
  print('product: ${product.id}');

  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5))),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(''),
              GestureDetector(
                onTap: () async {
                  String favoriteStatus =
                      await Get.find<AddFavoriteController>()
                          .addFavorites(product.id);
                  print(favoriteStatus);
                  if (favoriteStatus != '') {
                    if (favoriteStatus == 'Favorite Added' ||
                        favoriteStatus == 'Product added to favorites') {
                      Toast.success('${product.name} added to favorite products');
                    }
                    if (favoriteStatus == 'Favorite Deleted') {
                      Toast.error('${product.name} removed from favorite products');
                    }
                    await Get.find<FavoritesController>().getFavoriteProducts();
                  }
                },
                child: Obx(
                  () => Icon(
                    Icons.favorite,
                    color: Get.find<FavoritesController>()
                            .favoriteProducts
                            .any((element) => element.productId == product.id)
                        ? AppColors.primaryColor500
                        : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image(
                image: CachedNetworkImageProvider(product.image[0],
                    cacheKey: product.image[0],
                    scale: MediaQuery.of(context).devicePixelRatio * 2),
                filterQuality: FilterQuality.high,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(product.name, style: TextStyle(fontSize: 12)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Text(
                    '${product.productsize[0].productWeight.toStringAsFixed(2)} grams',
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Card(
                  color: CustomColors.COLOR_TWO,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Add to cart',
                        style: TextStyle(
                            fontSize: 12, color: CustomColors.COLOR_ONE)),
                  )),
            ],
          ),
        ],
      ),
    ),
  );
}
