import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../firebase_cache_manager.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;

  const CustomImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      cacheManager: FirebaseCacheManager.getInstance(),
      errorWidget: (context, url, dynamic error) {
        return const Icon(Icons.warning_rounded);
      },
      progressIndicatorBuilder: (context, url, progress) =>
          Center(child: CircularProgressIndicator(value: progress.progress)),
      fit: BoxFit.cover,
    );
  }
}
