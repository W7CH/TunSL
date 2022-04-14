// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'widgets/tip_page.dart';

class Tips extends StatefulWidget {
  @override
  _Tips createState() => _Tips();
}

class _Tips extends State<Tips> {
  final int _numPages = 7;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF23188F),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/background.png'),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back_ios_rounded,
                        color: Color(0xFF23188F)),
                  ),
                ),
                SizedBox(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      TipPage(
                          pictpath: 'assets/colors.png',
                          tip:
                              'Avoid wearing warm colors like red, orange and yellow and use instead cool colors such as blue, purple and green since they are peaceful colors and give a sense of calm and relaxation anywhere.'),
                      TipPage(
                          pictpath: 'assets/looking-away.png',
                          tip:
                              'Do not look away from the deaf person while he is talking to you'),
                      TipPage(
                          pictpath: 'assets/camera.png',
                          tip:
                              'Do not ignore the deaf person, for fear of not being able to understand, because he knows how to deliver information'),
                      TipPage(
                          pictpath: 'assets/camera.png',
                          tip:
                              'Do not move your head indicating that you understand his signs, when you did not understand his intention, because this would hurt his feelings'),
                      TipPage(
                          pictpath: 'assets/camera.png',
                          tip: 'Most deaf people read lip movement, so don'
                              't be afraid to communicate with them in words, but be clear and reduce your speaking speed'),
                      TipPage(
                          pictpath: 'assets/camera.png',
                          tip:
                              'Give the deaf person a pen and paper and ask them to draw or write what they want to say instead of giving up'),
                      TipPage(
                          pictpath: 'assets/camera.png',
                          tip:
                              'Do not talk to a deaf person unless your lips are exposed to them'),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
