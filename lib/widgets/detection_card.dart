// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:flutter/material.dart';

class DetectionCard extends StatelessWidget {
  late final String text;
  late final String pictpath;
  late final double pictwidth;
  late final Function() cardfunc;

  DetectionCard(
      {required this.text,
      required this.pictpath,
      required this.pictwidth,
      required this.cardfunc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
      child: TextButton(
          onPressed: cardfunc,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: Color(0xffA5678E),
                    fontFamily: 'Merriweather',
                    fontSize: 14),
              ),
              Image.asset(pictpath, height: 100, width: pictwidth),
            ],
          )),
    );
  }
}
