import 'package:flutter/material.dart';
import 'package:tortik/domain/repositories/video_post_repository.dart';

import '../../domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  //Get videos from repository
  final VideoPostRepository videosRepositoy;

  //Constructor
  DiscoverProvider({required this.videosRepositoy});

  Future<void> loadNextPage() async {
    //TO DO: Repository, Data source

    /*await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map(
            (video) => LocalVideoModel.fromJsonMap(video).toVideoPostIdentity())
        .toList();
    */
    final newVideos = await videosRepositoy.getTrendingVideosByPage(1);
    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
