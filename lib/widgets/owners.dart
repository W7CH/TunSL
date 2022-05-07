// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:tunsl/translation/translation_widget.dart';
import 'package:tunsl/translation/globals.dart' as globals;

class Owners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.maybeOf(context)!.size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Translator(
          text: 'Accomplished by:',
          fromLanguage: globals.fromLanguage,
          toLanguage: globals.toLanguage,
          builder: (translated) => Text(
            translated!,
            style: TextStyle(
                color: Color(0xffffffff),
                fontFamily: 'LibreFranklin',
                fontWeight: FontWeight.w300,
                fontSize: 16),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/wassim.jpg'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Wassim Chakroun',
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontFamily: 'LibreFranklin',
                      fontSize: 18),
                )
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('assets/riri.jpg'),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Rihab Jerbi',
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontFamily: 'LibreFranklin',
                      fontSize: 18),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: screenSize.height * 0.01,
        ),
        Translator(
          text: 'Engineering students at',
          fromLanguage: globals.fromLanguage,
          toLanguage: globals.toLanguage,
          builder: (translated) => Text(
            translated!,
            style: TextStyle(
                color: Color(0xffffffff),
                fontFamily: 'LibreFranklin',
                fontWeight: FontWeight.w300,
                fontSize: 16),
          ),
        ),
        Image.asset('assets/supcom.png', height: 35.0, width: 50.0)
      ],
    );
  }
}
