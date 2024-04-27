import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shopping_cart/components/custom_toast.dart';
import 'package:shopping_cart/utils/app_colors.dart';
import 'package:get/get.dart';
import 'controllers/PostControllers/add_delete_favorite_controller.dart';
import 'controllers/PostControllers/favorites_controller.dart';
import 'model/product_list_modal.dart';

class ImageCarousel extends StatefulWidget {
  final Product product;

  ImageCarousel({required this.product});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Stack(
          children: [
            InkWell(
              onTap: () => Get.toNamed('/product_image', arguments: {'title': widget.product.name, 'imageList': widget.product.image}),
              child: CarouselSlider(
                items: widget.product.image.map((url) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: width,
                        height: height * 0.38,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            url,
                            cacheKey: url,
                            scale: MediaQuery.of(context).devicePixelRatio
                          ),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit
                              .fill, // You can adjust the image fit as needed
                        )),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.38,
                  autoPlay: true, // Enable autoplay
                  autoPlayInterval:
                      Duration(seconds: 3), // Set the autoplay interval
                  viewportFraction: 1.0,
                  autoPlayAnimationDuration:
                      Duration(milliseconds: 1000), // Animation duration
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: GestureDetector(
                onTap: () async {
                  String favoriteStatus =
                      await Get.find<AddFavoriteController>()
                          .addFavorites(widget.product.id);
                  print(favoriteStatus);
                  if (favoriteStatus != '') {
                    if (favoriteStatus == 'Favorite Added' ||
                        favoriteStatus == 'Product added to favorites') {
                      Toast.success('${widget.product.name} added to favorite products');
                    }
                    if (favoriteStatus == 'Favorite Deleted') {
                      Toast.error('${widget.product.name} removed from favorite products');
                    }
                    await Get.find<FavoritesController>().getFavoriteProducts();
                  }
                },
                child: Obx(
                  () => Icon(
                    Icons.favorite,
                    color: Get.find<FavoritesController>().favoriteProducts.any(
                            (element) => element.productId == widget.product.id)
                        ? AppColors.primaryColor500
                        : Colors.grey,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              bottom: height * 0.035,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CarouselIndicator(
              width: 12,
              height: 8,
              count: widget.product.image.length,
              color: Colors.orange.shade200,
              index: _currentIndex,
              activeColor: AppColors.primaryColor,
            ),
                ))
          ],
        ),
      ],
    );
  }
}
