// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:tunsl/splash_screen.dart';
import 'tips.dart';
import 'static_detection.dart';
import 'help.dart';
import 'about.dart';

void main() {
  runApp(TunSL());
}

class TunSL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tunisian Sign Language',
      home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/tips': (context) => Tips(),
        '/help': (context) => Help(),
        '/about': (context) => AboutUs(),
        '/staticDetection': (context) => StaticDetection()
      },
    );
  }
}
