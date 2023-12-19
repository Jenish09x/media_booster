import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/screen/music/view/music_screen.dart';
import 'package:media_booster/screen/video/view/video_player_screen.dart';
import 'package:provider/provider.dart';

import '../provider/dash_provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({super.key});

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  DashProvider? providerR;
  DashProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR=context.read<DashProvider>();
    providerW=context.watch<DashProvider>();
    List<Widget>screen=[
      const MusicScreen(),
      const VideoPlayerScreen(),
    ];
    return SafeArea(
      child: Scaffold(
        body: screen[providerW!.stepIndex],
        bottomNavigationBar: CurvedNavigationBar(
          // currentIndex: providerR!.stepIndex,
          index: providerR!.stepIndex,
          backgroundColor:  const Color(0xff1e1d21ff),
          color: Colors.green.shade900,
          onTap: (value) {
            int i = value;
            providerR!.changeStep(i);
          },
          items: const [
              Icon(Icons.music_note_outlined),
              Icon(Icons.video_collection_outlined),
            // BottomNavigationBarItem(icon: Icon(Icons.video_collection_outlined), label: 'Video'),
          ],
        ),
      ),
    );
  }
}