import 'package:flutter/material.dart';
import 'package:media_booster/screen/dash/provider/dash_provider.dart';
import 'package:media_booster/screen/music/provider/music_provider.dart';
import 'package:media_booster/screen/video/provider/video_provider.dart';
import 'package:media_booster/utils/screen_routes.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DashProvider(),),
        ChangeNotifierProvider(create: (context) => MusicProvider(),),
        ChangeNotifierProvider(create: (context) => VideoProvider(),),
      ],
      child: MaterialApp(
        theme: ThemeData.dark(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        routes: app_routes,
      ),
    )
  );
}