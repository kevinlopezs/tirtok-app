import 'package:flutter/material.dart';
import 'package:tortik/presentation/widgets/video/video_background.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  //Properties
  final String videoURL;
  final String caption;

  const FullScreenPlayer(
      {super.key, required this.videoURL, required this.caption});

  //controller

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  //You use late when you dont know exact value for instance and
  //value could be null
  late VideoPlayerController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = VideoPlayerController.asset(widget.videoURL)
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          );
        }

        //Gesture detector is for pause video
        return GestureDetector(
          onTap: () {
            if (controller.value.isPlaying) {
              controller.pause();
              return;
            }
            //normally playing video
            controller.play();
          },
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(children: [
              //video controller
              VideoPlayer(controller),

              //gradient for video
              VideoBackground(
                stops: const [0.8, 1.0],
              ),
              //Caption for video
              Positioned(
                  bottom: 20,
                  left: 20,
                  child: _VideoCaption(caption: widget.caption))
            ]),
          ),
        );
      },
    );
  }
}

//Caption widget
class _VideoCaption extends StatelessWidget {
  //Properties
  final String caption;
  const _VideoCaption({required this.caption});

  @override
  Widget build(BuildContext context) {
    //instance from AppTheme
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    //Get phone size
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, maxLines: 2, style: titleStyle),
    );
  }
}
