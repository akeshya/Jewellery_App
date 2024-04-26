import 'package:flutter/material.dart';
import 'package:shopping_cart/components/reusable_cached_network_image.dart';

class ReusableCardWithImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double borderRadius;

  ReusableCardWithImage({
    required this.imageUrl,
    this.height = 100,
    this.borderRadius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: height,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          child: CachedNetworkImageView(imageUrl: imageUrl, fit: BoxFit.fill),
        ),
      ),
    );
  }
}