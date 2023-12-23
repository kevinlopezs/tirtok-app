import 'package:tortik/domain/datasources/video_posts_datasource.dart';
import 'package:tortik/domain/entities/video_post.dart';
import 'package:tortik/domain/repositories/video_post_repository.dart';

class VidePostRepositoryImpl implements VideoPostRepository {
  //define datasouce
  final VideoPostDataSource videosDataSource;
  //consturctor
  VidePostRepositoryImpl({required this.videosDataSource});

  @override
  Future<List<VideoPost>> getFAvoriteVideosByUser(String userID) {
    // TODO: implement getFAvoriteVideosByUser
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    // TODO: implement videosDataSource to get data
    return videosDataSource.getTrendingVideosByPage(page);
  }
}
