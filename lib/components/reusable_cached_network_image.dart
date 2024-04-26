import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CachedNetworkImageView extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;

  CachedNetworkImageView({
    required this.imageUrl,
    this.fit = BoxFit.fill,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: CachedNetworkImageProvider(imageUrl,
          cacheKey: imageUrl,
          scale: MediaQuery.of(context).devicePixelRatio * 2
      ),
      fit: fit,
      filterQuality: FilterQuality.high,
    );
  }
}
