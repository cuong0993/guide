import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:readmore/readmore.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../detail_post/like_controller.dart';
import '../router/router.dart';
import '../widgets/custom_image.dart';
import 'post.dart';
import 'view_image.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: GestureDetector(
        onTap: () => AutoRouter.of(context)
            .push(DetailPostRoute(post: post, isGoingToComment: false)),
        child: Container(
          color: Theme.of(context).cardColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () =>
                    AutoRouter.of(context).push(UserRoute(userId: post.userId)),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      post.userPhotoUrl.isNotEmpty
                          ? CircleAvatar(
                              radius: 24,
                              backgroundColor: const Color(0xff4D4D4D),
                              backgroundImage:
                                  CachedNetworkImageProvider(post.userPhotoUrl),
                            )
                          : const CircleAvatar(
                              radius: 24,
                              backgroundColor: Color(0xff4D4D4D),
                            ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            post.userName,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(timeago.format(post.createdDate),
                              style: const TextStyle(fontSize: 10))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: post.text.toString().isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: ReadMoreText(
                    post.text,
                    trimLines: 2,
                    style: const TextStyle(fontSize: 15),
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'more',
                    trimExpandedText: '',
                    moreStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              _buildImageGridView(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Wrap(
                  spacing: 4,
                  runSpacing: 2,
                  children: post.tags
                      .map((e) => Chip(
                            label: Text(e),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Consumer(builder: (context, ref, child) {
                          final liked = ref.watch(likedProvider(post));
                          return IconButton(
                            icon: Icon(
                              Icons.arrow_upward,
                              color:
                                  liked ? Theme.of(context).accentColor : null,
                            ),
                            onPressed: () async {
                              await ref
                                  .read(likeProvider(post).notifier)
                                  .toggleLike(!liked);
                            },
                          );
                        }),
                        const SizedBox(width: 16),
                        Visibility(
                          visible: post.likedUserIds.isNotEmpty,
                          child: Text(
                            post.likedUserIds.length.toString(),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.comment),
                          onPressed: () => AutoRouter.of(context).push(
                              DetailPostRoute(
                                  post: post, isGoingToComment: true)),
                        ),
                        const SizedBox(width: 16),
                        Visibility(
                          visible: post.commentCount > 0,
                          child: Text(
                            post.commentCount.toString(),
                            overflow: TextOverflow.fade,
                            softWrap: false,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageGridView() {
    if (post.images.isNotEmpty) {
      return StaggeredGridView.countBuilder(
        crossAxisCount: () {
          switch (post.images.length) {
            case 1:
              {
                return 1;
              }
            case 2:
              {
                return 2;
              }
            case 3:
              {
                return 2;
              }
            case 4:
              {
                return 3;
              }
            case 5:
              {
                return 6;
              }
            default:
              {
                return 0;
              }
          }
        }(),
        itemCount: post.images.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => OpenContainer(
            openBuilder: (context, _) {
              return ViewImage(post: post, index: index);
            },
            closedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(0)),
            ),
            closedBuilder: (context, openContainer) {
              return CustomImage(imageUrl: post.images[index]);
            }),
        staggeredTileBuilder: (index) {
          switch (post.images.length) {
            case 1:
              {
                return const StaggeredTile.count(1, 1);
              }
            case 2:
              {
                return const StaggeredTile.count(1, 2);
              }
            case 3:
              {
                if (index == 0) {
                  return const StaggeredTile.count(2, 1);
                } else {
                  return const StaggeredTile.count(1, 1);
                }
              }
            case 4:
              {
                if (index == 0) {
                  return const StaggeredTile.count(3, 2);
                } else {
                  return const StaggeredTile.count(1, 1);
                }
              }
            case 5:
              {
                if (index < 2) {
                  return const StaggeredTile.count(3, 3);
                } else {
                  return const StaggeredTile.count(2, 2);
                }
              }
            default:
              {
                return const StaggeredTile.count(1, 1);
              }
          }
        },
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
