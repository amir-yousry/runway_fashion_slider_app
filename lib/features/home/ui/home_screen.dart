import 'package:flutter/material.dart';
import 'package:runway_fashion_slider_app/core/widgets/custom_appbar.dart';
import 'package:runway_fashion_slider_app/features/categories/ui/categories_screen.dart';
import 'package:runway_fashion_slider_app/features/home/data/categories.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.asset("assets/video/video.mp4")
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      })
      ..setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Runway',
        prefix: 'assets/svgs/menu.svg',
        suffix: 'assets/svgs/notification.svg',
      ),
      body: Stack(
        children: [
          /// video
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),

          ///categories
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      "Categories",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(categories.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CategoriesScreen(),
                                ),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    categories[index].image,
                                    width: 75,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    categories[index].name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
