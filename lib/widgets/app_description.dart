// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

class AppDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.maybeOf(context)!.size;
    return Column(children: [
      Image(
        image: AssetImage(
          'assets/logo.png',
        ),
        height: screenSize.height * 0.3,
      ),
      const SizedBox(
        height: 10.0,
      ),
      const Text(
        'TunSL',
        style: TextStyle(
            fontSize: 20,
            fontFamily: 'Merriweather',
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
      SizedBox(
        height: 20.0,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          'TunSL is a mobile application allowing the recognition of Tunisian sign language and its translation into text.',
          style: TextStyle(
              color: Color(0xffffffff),
              fontFamily: 'LibreFranklin',
              //fontWeight: FontWeight.w100,
              fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    ]);
  }
}
