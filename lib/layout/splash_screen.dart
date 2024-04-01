import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen(
      backgroundColor: Colors.white,
      splashScreenBody: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/splash.png'))),
      ),
      nextScreen: HomeScreen(),
    );
  }
}
