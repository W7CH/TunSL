// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  late final String pictpath;
  late final String title;
  late final String role;

  HelpPage({required this.pictpath, required this.title, required this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                pictpath,
              ),
              height: 80.0,
              width: 100.0,
            ),
          ),
          //SizedBox(height: 20.0),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xffA5678E),
                fontFamily: 'Merriweather',
                fontSize: 18),
          ),
          //SizedBox(height: 15.0),
          Text(
            role,
            textAlign: TextAlign.justify,
            style: TextStyle(
                color: Color(0xff7C7C7A),
                fontFamily: 'LibreFranklin',
                fontWeight: FontWeight.w100,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
