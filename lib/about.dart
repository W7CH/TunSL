// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
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
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(Icons.arrow_back_ios_rounded,
                    color: Color(0xFF23188F)),
              ),
            ),
            SizedBox(height: screenSize.height*0.05,),
            Image(
              image: AssetImage('assets/logo.png',),
              height: screenSize.height * 0.3,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              'TunSL',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Merriweather',
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(height: 10.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('TunSL is a mobile application allowing the recognition of Tunisian sign language and its translation into text.',style: TextStyle(color: Color(0xffffffff),
                  fontFamily: 'LibreFranklin',
                  //fontWeight: FontWeight.w100,
                  fontSize: 14),
              textAlign: TextAlign.center,),
            ),
            SizedBox(
              height: screenSize.height * 0.1,
            ),
            Text('Brought to you by:',style: TextStyle(color: Color(0xffffffff),
                fontFamily: 'LibreFranklin',
                //fontWeight: FontWeight.w100,
                fontSize: 10),),
            SizedBox(height: 10.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/wassim.jpg'),
                    ),
                    Text('Wassim Chakroun',style: TextStyle(color: Color(0xffffffff),
                        fontFamily: 'LibreFranklin',
                        //fontWeight: FontWeight.w100,
                        fontSize: 10),)
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/riri.jpg'),
                    ),
                    Text('Rihab Jerbi',style: TextStyle(color: Color(0xffffffff),
                        fontFamily: 'LibreFranklin',
                        fontWeight: FontWeight.w100,
                        fontSize: 10),)
                  ],
                ),
              ],
            ),
            SizedBox(height: screenSize.height * 0.01,),
            Text('Engineering students at',style: TextStyle(color: Color(0xffffffff),
                fontFamily: 'LibreFranklin',
                fontWeight: FontWeight.w100,
                fontSize: 10),),
            Image.asset('assets/supcom.png', height: 25.0, width: 50.0)
          ]),
        ),
      ),
    );
  }
}
