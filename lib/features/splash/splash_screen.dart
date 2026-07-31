import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:runway_fashion_slider_app/features/home/ui/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (c) => HomeScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/logo/logo.svg', width: 188),
            SizedBox(height: 10),
            SvgPicture.asset('assets/logo/line.svg', width: 190),
          ],
        ),
      ),
    );
  }
}
