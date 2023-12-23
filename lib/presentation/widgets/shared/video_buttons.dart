import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tortik/config/helpers/human.formats.dart';

import '../../../domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //Likes button
      _CustomIconButton(
          iconData: Icons.favorite,
          value: video.likes,
          iconColor: Colors.redAccent),
      const SizedBox(height: 20),

      //Views button
      _CustomIconButton(
          iconData: Icons.remove_red_eye_outlined, value: video.views),
      const SizedBox(height: 20),

      //Animate spin button
      SpinPerfect(
          infinite: true,
          child: const _CustomIconButton(
              iconData: Icons.play_circle_outline, value: 0)),
    ]);
  }
}

//Custom widget for iconbuttons in my app
class _CustomIconButton extends StatelessWidget {
  //Properties
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButton(
      {required this.value, required this.iconData, iconColor})
      : color = iconColor ?? Colors.white; //This is an assert for white default

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {}, icon: Icon(iconData, color: color, size: 30)),
        //with if confitional value 0 in icon is off
        if (value > 0) Text(HumanFormats.humanReadbleNumber(value.toDouble()))
      ],
    );
  }
}
