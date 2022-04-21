// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

class TipPage extends StatelessWidget {
  late final String pictpath;
  late final String tip;

  TipPage({required this.pictpath, required this.tip});

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
              height: 200.0,
              width: 200.0,
            ),
          ),
          SizedBox(height: 45.0),
          Text(
            tip,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15.0),
          ),
        ],
      ),
    );
  }
}
