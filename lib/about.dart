// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/background.png'),
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Idea of TunSL?'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('assets/wess.jpg'),
                    ),
                    Text('Wassim Chakroun')
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('assets/rihab.png'),
                    ),
                    Text('Rihab Jerbi')
                  ],
                ),
              ],
            ),
            Text('Engineering students at'),
            Image.asset('assets/supcom.png', height: 100.0, width: 100.0)
          ]),
        ),
      ),
    );
  }
}
