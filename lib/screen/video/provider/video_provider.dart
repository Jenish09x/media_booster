import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../model/video_model.dart';


class VideoProvider with ChangeNotifier {
  VideoPlayerController? videoPlayerController;
  ChewieController? controller;
  int index = 0;
  int storeIndex=0;
  List<VideoModel> videoList = [
    VideoModel(
        title: 'Desi_Desi_Na_Bolya_Kar',
        image: 'assets/logo/desi.jpg',
        video: 'assets/video/Desi_Desi_Na_Bolya_Kar_Chori_Re.mp4'),
    VideoModel(
        title: 'Satisfy',
        image: 'assets/logo/satisfy.jpg',
        video: 'assets/video/Imran_Khan.mp4'),
    VideoModel(
        title: 'Kahani_suno',
        image: 'assets/logo/kahani.jpg',
        video: 'assets/video/Kaifi_Khalil.mp4'),
    VideoModel(
        title: 'Mere_Wala_Sardaar_2',
        image: 'assets/logo/sardaar.jpg',
        video: 'assets/video/Mere_Wala_Sardaar.mp4'),
    VideoModel(
        title: 'Tokyo_Drift',
        image: 'assets/logo/tokyo_.jpg',
        video: 'assets/video/Tokyo_Drift.mp4'),
  ];

  void changIndex(int i) {
    index = i;
    notifyListeners();
  }

  void changeStepIndex(int i)
  {
    storeIndex=i;
    notifyListeners();
  }
}