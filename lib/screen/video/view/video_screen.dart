import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  PageController pageController = PageController();
  CarouselController carouselController = CarouselController();
  VideoProvider? providerR;
  VideoProvider? providerW;

  @override
  Widget build(BuildContext context) {
    providerR=context.read<VideoProvider>();
    providerW=context.watch<VideoProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("VideoPlayer"),
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
                        context.read<VideoProvider>().changIndex(index);
                        Navigator.pushNamed(context, "VideoPlayer");
                      },
                      child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.13,
                        width: MediaQuery.sizeOf(context).width * 0.75,
                        color: Colors.primaries[index],
                        child: Image.asset("${providerR!.videoList[index].image}",fit: BoxFit.fill,),
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
                        activeDotColor: Colors.blue,
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
                itemCount: providerR!.videoList.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Image.asset(
                    "${providerR!.videoList[index].image}",
                    height: 50,
                  ),
                  title: Text("${providerR!.videoList[index].title}"),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<VideoProvider>().changIndex(index);
                      Navigator.pushNamed(context, "VideoPlayer");
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