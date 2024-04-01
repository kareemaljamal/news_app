import 'package:flutter/material.dart';
import 'package:news_app/layout/home_screen.dart';
import 'package:news_app/layout/splash_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
      },
    );
  }
}
