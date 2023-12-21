import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

import '../model/music_model.dart';

class  MusicProvider with ChangeNotifier
{
  int storeIndex=0;
  AssetsAudioPlayer player = AssetsAudioPlayer();
  void changeStepIndex(int i)
  {
    storeIndex=i;
    notifyListeners();
  }
  List<MusicModel> musicList = [
    MusicModel(
        name: "Har Funn Maula(From 'Koi Jaane Na')",
        music: "assets/music/Har Funn Maula.m4a",
        image: "assets/images/img1.jpeg"),
    MusicModel(
        name: "Haryana Hood",
        music: "assets/music/Haryana Hood.m4a",
        image: "assets/images/Haryana Hood.jpg"),
    MusicModel(
        name: "Harleys In Hawaii",
        music: "assets/music/Harleys In Hawaii.m4a",
        image: "assets/images/Harley_Hawaii.jpg"),
    MusicModel(
        name: "Kalaastar(From 'Honey 3.0')",
        music: "assets/music/Desi Kalakaar.m4a",
        image: "assets/images/Desi_Kalakaar.jpg"),
    MusicModel(
        name: "Brown Rang",
        music: "assets/music/Brown Rang.m4a",
        image: "assets/images/Brown_Rang.jpg"),
  ];
  bool isPlay = false;
  Duration totalDuration = const Duration(seconds: 0);
  int index = 0;

  void checkStatus(bool status) {
    isPlay = status;
    notifyListeners();
  }

  void changIndex(int i) {
    index = i;
    notifyListeners();
  }

  void changTotalDuration(Duration d1) {
    totalDuration = d1;
    notifyListeners();
  }

}