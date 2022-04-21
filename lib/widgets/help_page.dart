// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  late final String pictpath;
  late final String title;
  late final String role;

  HelpPage({required this.pictpath, required this.title, required this.role});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(
              image: AssetImage(
                pictpath,
              ),
              height: 150.0,
              width: 150.0,
            ),
          ),
          SizedBox(height: 30.0),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text(
            role,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
