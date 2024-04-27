import 'package:flutter/material.dart';
import 'package:shopping_cart/components/reusable_card_with_image.dart';
import 'package:shopping_cart/controllers/GetControllers/category_list_controller.dart';
import 'package:shopping_cart/model/banners_modal.dart' as banners;
import 'package:get/get.dart';

Widget createArrivals(String image) {
  return Card(
    margin: EdgeInsets.all(10),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12))),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
    ),
  );
}

Widget createBanners(
    BuildContext context, banners.Banner banner) {
  final categoryListController = Get.find<CategoryListController>();

  final bannerCategory = categoryListController.categoriesList.firstWhere((element) => element.id == int.parse(banner.categoryId));

  return Container(
    width: 300,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 1), // Changes the shadow offset
        ),
      ],
    ),
    child: GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/product_listing', arguments: bannerCategory),
      child: ReusableCardWithImage(
          imageUrl: banner.image,
          borderRadius: 10),
    ),
  );
}