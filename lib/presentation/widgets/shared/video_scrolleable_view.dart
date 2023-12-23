import 'package:flutter/material.dart';
import 'package:tortik/domain/entities/video_post.dart';
import 'package:tortik/presentation/widgets/shared/video_buttons.dart';
import 'package:tortik/presentation/widgets/video/fullscreen_player.dart';

class VideoScrollableView extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollableView({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        //itemCount: videos.length,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),

        /*children: [
        Container(color: Colors.redAccent),
        Container(color: Colors.tealAccent),
        Container(color: Colors.limeAccent),
        Container(color: Colors.lightBlueAccent),
      ],
    );*/

        itemBuilder: (context, index) {
          final VideoPost videoPost = videos[index];

          return Stack(
            children: [
              //Video Player
              SizedBox.expand(
                child: FullScreenPlayer(
                    videoURL: videoPost.videoUrl, caption: videoPost.caption),
              ),

              //Gradiente

              //Position
              Positioned(
                  bottom: 40, right: 20, child: VideoButtons(video: videoPost))
            ],
          );
        });
  }
}
