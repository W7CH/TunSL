import 'package:flutter/material.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _navigatetohome();
    controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    controller.addListener(() {
      //print(animation.value);
    });
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) =>  const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                  ScaleTransition(
                    scale: animation,
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 0.0),
                        child: const Image(
                          image: AssetImage('assets/logo.png',),
                        )),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'TunSL',
                    style: TextStyle(
                        fontSize: 48,
                        fontFamily: 'Merriweather',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Text('Your voice to communicate with the world!',
                      style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'LibreFranklin',
                          color: Colors.white)),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const CircularProgressIndicator(
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
