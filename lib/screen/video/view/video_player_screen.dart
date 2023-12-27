import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../provider/video_provider.dart';


class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;

  @override
  void initState() {
    super.initState();
    context
        .read<VideoProvider>()
        .videoPlayerController =
    VideoPlayerController.asset('${context.read<VideoProvider>().videoList[context.read<VideoProvider>().index].video}')
      ..initialize().then((value) {
        setState(() {});
      });
    context
        .read<VideoProvider>()
        .controller = ChewieController(
        videoPlayerController:
        context
            .read<VideoProvider>()
            .videoPlayerController!);
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '${providerW!.videoList[providerW!.index].title}',
            style: const TextStyle(color: Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: SizedBox(
            height: 350,
            width: double.infinity,
            child:
            Chewie(controller: context
                .read<VideoProvider>()
                .controller!),
          ),
        ),
      ),
    );
  }
}