// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

class TipPage extends StatelessWidget {
  late final String pictpath;
  late final String tip;

  TipPage({required this.pictpath, required this.tip});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.maybeOf(context)!.size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 60,vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                pictpath,
              ),
              height: screenSize.width * 0.5,
              width: screenSize.height* 0.5,
            ),
          ),
          SizedBox(height: 45.0),
          Text(
            tip,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Color(0xff7C7C7A),
                fontFamily: 'LibreFranklin',
                fontWeight: FontWeight.w100,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
