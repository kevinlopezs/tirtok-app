import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tortik/config/theme/app_theme.dart';
import 'package:tortik/infrastructure/datasources/local_video_datasource_impl.dart';
import 'package:tortik/infrastructure/repositories/video_post_repository_impl.dart';
import 'package:tortik/presentation/providers/discover_provider.dart';
import 'package:tortik/presentation/screens/discover_screen.dart';

void main() {
  runApp(const Tortik());
}

class Tortik extends StatelessWidget {
  const Tortik({super.key});

  @override
  Widget build(BuildContext context) {
    //Instance of datasource
    final LocalVideoDataSource localVideosDataSource = LocalVideoDataSource();

    //Instance of repository
    final VidePostRepositoryImpl videosPostRepositoy =
        VidePostRepositoryImpl(videosDataSource: localVideosDataSource);

    //Remember install first "provider" in pubspec.yalm
    return MultiProvider(
      //This is an instance for use Multiprovider classes
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                DiscoverProvider(videosRepositoy: videosPostRepositoy)
                  ..loadNextPage()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const DiscoverScreen(),
      ),
    );
  }
}
