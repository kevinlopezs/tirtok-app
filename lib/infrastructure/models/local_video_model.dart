import 'package:tortik/domain/entities/video_post.dart';

class LocalVideoModel {
  //Properties

  final String caption;
  final String videoUrl;
  final int views;
  final int likes;

  //For APIS is necessary see docs to detect what are required
  LocalVideoModel(
      {required this.caption,
      required this.videoUrl,
      this.likes = 0,
      this.views = 0});

  factory LocalVideoModel.fromJsonMap(Map<String, dynamic> json) =>
      LocalVideoModel(
          caption: json['name'],
          videoUrl: json['videoUrl'],
          likes: json['likes'],
          views: json['views']);

  //Method for relation entities with map from json
  //and used with points for better control
  VideoPost toVideoPostIdentity() => VideoPost(
      caption: caption, videoUrl: videoUrl, likes: likes, views: views);
}
