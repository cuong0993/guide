import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../firebase_cache_manager.dart';
import 'post.dart';

class ViewImage extends StatelessWidget {
  final Post post;
  final int index;

  const ViewImage({Key? key, required this.post, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: post.images[index],
          cacheManager: FirebaseCacheManager.getInstance(),
          progressIndicatorBuilder: (context, url, progress) => Center(
              child: CircularProgressIndicator(value: progress.progress)),
          errorWidget: (context, url, dynamic error) {
            return const Icon(Icons.warning_rounded);
          },
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
