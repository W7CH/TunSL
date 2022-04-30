// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

class Owners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.maybeOf(context)!.size;
    return Column(
      children: [
        Text(
          'Brought to you by:',
          style: TextStyle(
              color: Color(0xffffffff),
              fontFamily: 'LibreFranklin',
              //fontWeight: FontWeight.w100,
              fontSize: 16),
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
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/wassim.jpg'),
                ),
                Text(
                  'Wassim Chakroun',
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontFamily: 'LibreFranklin',
                      //fontWeight: FontWeight.w100,
                      fontSize: 14),
                )
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage('assets/riri.jpg'),
                ),
                Text(
                  'Rihab Jerbi',
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontFamily: 'LibreFranklin',
                      //fontWeight: FontWeight.w100,
                      fontSize: 14),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: screenSize.height * 0.01,
        ),
        Text(
          'Engineering students at',
          style: TextStyle(
              color: Color(0xffffffff),
              fontFamily: 'LibreFranklin',
              fontWeight: FontWeight.w100,
              fontSize: 16),
        ),
        Image.asset('assets/supcom.png', height: 35.0, width: 50.0)
      ],
    );
  }
}
