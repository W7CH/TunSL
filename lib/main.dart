// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:tunsl/splash_screen.dart';

void main() {
  runApp(TunSL());
}

class TunSL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
