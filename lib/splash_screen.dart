// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 3000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/background.png'),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 0.0),
                      child: const Image(
                        image: AssetImage('assets/logo.png'),
                      )),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'TunSL',
                    style: TextStyle(
                        fontSize: 48,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text('Your voice to communicate with the world!',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Merriweather',
                          color: Colors.white)),
                  SizedBox(
                    height: 70.0,
                  ),
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
