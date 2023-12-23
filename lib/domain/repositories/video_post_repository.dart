import 'package:tortik/domain/entities/video_post.dart';

//las clases abstractas son como un molde que no se puede modificar
abstract class VideoPostRepository {
  Future<List<VideoPost>> getTrendingVideosByPage(int page);
  Future<List<VideoPost>> getFAvoriteVideosByUser(String userID);
}
