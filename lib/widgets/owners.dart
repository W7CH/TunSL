// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

class Owners extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.maybeOf(context)!.size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Brought to you by:',
          style: TextStyle(
              color: Color(0xffffffff),
              fontFamily: 'LibreFranklin',
              fontWeight: FontWeight.bold,
              fontSize: 24),
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
                SizedBox(height: 20.0,),
                Text(
                  'Wassim Chakroun',
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontFamily: 'LibreFranklin',
                      //fontWeight: FontWeight.w100,
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
                SizedBox(height: 20.0,),
                Text(
                  'Rihab Jerbi',
                  style: TextStyle(
                      color: Color(0xffffffff),
                      fontFamily: 'LibreFranklin',
                      //fontWeight: FontWeight.w100,
                      fontSize: 18),
                )
              ],
            ),
          ],
        ),
        SizedBox(
          height: screenSize.height * 0.01,
        ),
        Column(
          children: [
            Text(
              'Engineering students at',
              style: TextStyle(
                  color: Color(0xffffffff),
                  fontFamily: 'LibreFranklin',
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Image.asset('assets/supcom.png', height: 75.0, width: 100.0),
          ],
        )
      ],
    );
  }
}
