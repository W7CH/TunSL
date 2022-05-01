// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'widgets/detection_card.dart';
import 'widgets/expandable_element.dart';
import 'package:expandable_card/expandable_card.dart';
import 'translation/globals.dart' as globals;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.maybeOf(context)!.size;
    return SafeArea(
      child: Scaffold(
        body: ExpandableCardPage(
          expandableCard: ExpandableCard(
              //padding: EdgeInsets.zero,
              backgroundColor: Colors.white,
              hasRoundedCorners: true,
              minHeight: 80.0,
              maxHeight: 300.0,
              children: [
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, elevation: 0),
                      child: ExpandableElement(
                        elementIcon: Icon(Icons.article_outlined,
                            size: 25.0, color: Colors.black87),
                        elementText: 'Tips for you',
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/tips'),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, elevation: 0),
                      child: ExpandableElement(
                        elementIcon: Icon(Icons.help_outline_outlined,
                            size: 25.0, color: Colors.black87),
                        elementText: 'Help',
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/help'),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, elevation: 0),
                      child: ExpandableElement(
                        elementIcon: Icon(Icons.info_outline,
                            size: 25.0, color: Colors.black87),
                        elementText: 'About us',
                      ),
                      onPressed: () => Navigator.pushNamed(context, '/about'),
                    ),
                  ],
                ),
              ]),
          page: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/background.png'),
              ),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  width: screenSize.width,
                  height: 80.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0)),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/logo2.png',
                        height: 40.0,
                        width: screenSize.width * 0.1,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'TunSL',
                        style: TextStyle(
                            color: Color(0xff231991),
                            fontFamily: 'Merriweather',
                            fontSize: 20.0),
                      ),
                      SizedBox(
                        width: screenSize.width * 0.5,
                      ),
                      PopupMenuButton(
                        initialValue: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        tooltip: 'Language',
                        child: CircleAvatar(
                          radius: 15.0,
                          backgroundColor: Color(0xff231991),
                          child: Icon(
                            Icons.translate_outlined,
                            color: Colors.white,
                            size: 15.0,
                          ),
                        ),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Center(
                              child: Image.asset('assets/English.png',
                                  semanticLabel: 'English',
                                  width: 50.0,
                                  height: 50.0),
                            ),
                            onTap: () => setState(() {
                              globals.fromLanguage = globals.toLanguage;
                              globals.toLanguage = 'English';
                            }),
                          ),
                          PopupMenuItem(
                            child: Center(
                              child: Image.asset('assets/French.png',
                                  semanticLabel: 'French',
                                  width: 50.0,
                                  height: 50.0),
                            ),
                            onTap: () => setState(() {
                              globals.fromLanguage = globals.toLanguage;
                              globals.toLanguage = 'French';
                            }),
                          ),
                          PopupMenuItem(
                            child: Center(
                              child: Image.asset('assets/Tunisian.png',
                                  semanticLabel: 'Tunisian',
                                  width: 50.0,
                                  height: 50.0),
                            ),
                            onTap: () => setState(() {
                              globals.fromLanguage = globals.toLanguage;
                              globals.toLanguage = 'Tunisian';
                            }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * 0.18,
                ),
                DetectionCard(
                    text: 'Detection with camera',
                    pictpath: 'assets/camera.png',
                    pictwidth: screenSize.width * 0.2,
                    cardfunc: () {}),
                DetectionCard(
                    text: 'Detection with image',
                    pictpath: 'assets/photo.png',
                    pictwidth: screenSize.width * 0.2,
                    cardfunc: () {
                      Navigator.pushNamed(context, '/staticDetection');
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
