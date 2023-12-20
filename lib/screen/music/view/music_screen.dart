import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/screen/music/provider/music_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  PageController pageController = PageController();
  CarouselController carouselController = CarouselController();
  MusicProvider? providerR;
  MusicProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR = context.read<MusicProvider>();
    providerW = context.watch<MusicProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Music Player"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SizedBox(height: 270,
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    carouselController: carouselController,
                    itemCount: 5,
                    itemBuilder: (context, index, realIndex) => InkWell(
                      onTap: () {
                        context.read<MusicProvider>().changIndex(index);
                        Navigator.pushNamed(context, "MusicPlayer");
                      },
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.13,
                        width: MediaQuery.sizeOf(context).width * 0.80,
                        color: Colors.primaries[index],
                        child: Image.asset("${providerR!.musicList[index].image}",fit: BoxFit.cover,),
                      ),
                    ),
                    options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          providerW!.changeStepIndex(index);
                        },
                        initialPage: providerR!.storeIndex,
                        animateToClosest: true,
                        autoPlay: true,
                        enlargeCenterPage: true),
                  ),
                  Align(
                    alignment: const Alignment(0, 0.95),
                    child: SmoothPageIndicator(
                      onDotClicked: (index) {
                        providerW!.changeStepIndex(index);
                      },
                      controller:
                          PageController(initialPage: providerR!.storeIndex),
                      count: 5,
                      effect: const WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: Colors.green,
                        dotColor: Colors.grey,
                        // type: WormType.thinUnderground
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Expanded(
              child: ListView.builder(
                itemCount: providerR!.musicList.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Image.asset(
                    "${providerR!.musicList[index].image}",
                    height: 50,
                  ),
                  title: Text("${providerR!.musicList[index].name}"),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<MusicProvider>().changIndex(index);
                      Navigator.pushNamed(context, "MusicPlayer");
                    },
                    icon: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}