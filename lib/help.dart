// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'widgets/help_page.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.maybeOf(context)!.size;
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
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back_ios_rounded,
                    color: Color(0xFF23188F)),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.05,
            ),
            HelpPage(
                pictpath: 'assets/camera.png',
                title: 'Detection with camera',
                role:
                    'It allows the opening of the camera in order to detect signs in real time mode. Once the camera is launched, the signs are filmed and those recognized are displayed on the screen.'),
            HelpPage(
                pictpath: 'assets/photo.png',
                title: 'Detection with image',
                role:
                    'It consists in picking an image from the phone storage to detect signs on it. The recognized signs are then displayed on the screen.'),
          ]),
        ),
      ),
    );
  }
}
