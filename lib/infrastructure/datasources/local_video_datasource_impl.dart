import 'package:tortik/domain/datasources/video_posts_datasource.dart';
import 'package:tortik/domain/entities/video_post.dart';

import '../../shared/data/local_data_video_post.dart';
import '../models/local_video_model.dart';

class LocalVideoDataSource implements VideoPostDataSource {
  @override
  Future<List<VideoPost>> getFAvoriteVideosByUser(String userID) {
    // TODO: implement getFAvoriteVideosByUser
    throw UnimplementedError();
  }

  //This is function when we get local video from json
  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    //TODO: Repository, Data source

    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map(
            (video) => LocalVideoModel.fromJsonMap(video).toVideoPostIdentity())
        .toList();

    return newVideos;
  }
}
