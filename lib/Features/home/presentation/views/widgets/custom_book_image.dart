import 'package:bookly_app/core/utils/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 140 / 224,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => const Icon(Icons.error),
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
          )),
    );
  }
}
