import 'package:flutter/cupertino.dart';
import 'package:media_booster/screen/music/view/music_player_screen.dart';
import 'package:media_booster/screen/video/view/video_player_screen.dart';

import '../screen/dash/view/dash_screen.dart';

// ignore: non_constant_identifier_names
Map<String,WidgetBuilder>app_routes={
  '/':(context) => const DashScreen(),
  'MusicPlayer':(context) => const MusicPlayerScreen(),
  'VideoPlayer':(context) => const VideoPlayerScreen(),
};