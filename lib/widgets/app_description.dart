// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:tunsl/translation/translation_widget.dart';
import 'package:tunsl/translation/globals.dart' as globals;

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
      SizedBox(
        height: 20.0,
      ),
      Text(
        'TunSL',
        style: TextStyle(
            fontSize: 20,
            fontFamily: 'Merriweather',
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
      SizedBox(
        height: 10.0,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Translator(
          text:
              'TunSL is a mobile application allowing the recognition of Tunisian sign language and its translation into text.',
          fromLanguage: globals.fromLanguage,
          toLanguage: globals.toLanguage,
          builder: (translated) => Text(
            translated!,
            style: TextStyle(
                color: Color(0xffffffff),
                fontFamily: 'LibreFranklin',
                //fontWeight: FontWeight.w100,
                fontSize: 14),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    ]);
  }
}
