import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tortik/presentation/providers/discover_provider.dart';
import 'package:tortik/presentation/widgets/shared/video_scrolleable_view.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //This is way to Provider watch, listen or read
    final discoverProvider = context.watch<DiscoverProvider>();

    return Scaffold(
        //this is a condition if video data is loaded or not
        body: discoverProvider.initialLoading
            //this means that if initialLoading is true, progress is show it
            ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
            //PlaceHolder() is an X for testing
            : VideoScrollableView(
                videos: discoverProvider.videos,
              ));
  }
}
