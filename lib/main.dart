// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tunsl/detectScreen.dart';
import 'package:tunsl/splash_screen.dart';
import 'tips.dart';
import 'static_detection.dart';
import 'help.dart';
import 'about.dart';
List<CameraDescription>? cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print('Error: $e.code\nError Message: $e.message');
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((value) => runApp(TunSL()));

}

class TunSL extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tunisian Sign Language',
      home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/tips': (context) => Tips(),
        '/help': (context) => Help(),
        '/about': (context) => AboutUs(),
        '/staticDetection': (context) => StaticDetection(),
        '/dynamicDetection': (context) => DetectScreen(cameras!),
      },
    );
  }
}
