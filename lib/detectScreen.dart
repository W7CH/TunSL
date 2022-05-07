// ignore_for_file: unnecessary_null_comparison, deprecated_member_use, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tflite/tflite.dart';
import 'dart:math' as math;
import 'package:tunsl/models/camera.dart';
import 'package:tunsl/models/bndbox.dart';
import 'package:tunsl/models/models.dart';



class DetectScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const DetectScreen(this.cameras);

  @override
  _DetectScreenState createState() =>  _DetectScreenState();
}

class _DetectScreenState extends State<DetectScreen> {
  List<dynamic>? _recognitions;
  int _imageHeight = 0;
  int _imageWidth = 0;
  String _model = "";
  @override
  void initState() {
    super.initState();
  }

  loadModel() async {
    String? res;
    switch (_model) {
      case tunsl:
        res = await Tflite.loadModel(
            model: "assets/model/model_unquant.tflite", labels: "assets/model/labels.txt");
        break;


      default:
        res = await Tflite.loadModel(
            model: "assets/model/model_unquant.tflite", labels: "assets/model/labels.txt");
    }
    print(res);
  }

  onSelect(model) {
    setState(() {
      _model = model;
    });
    loadModel();
  }

  setRecognitions(recognitions, imageHeight, imageWidth) {
    print(recognitions);
    setState(() {
      _recognitions = recognitions;
      _imageHeight = imageHeight;
      _imageWidth = imageWidth;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: _model == ""
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: const Text(tunsl),
                      onPressed: () => onSelect(tunsl),
                    ),

                    RaisedButton(
                      child: const Text(tunsl),
                      onPressed: () => onSelect(tunsl),
                    ),
                  ],
                ),
              )
            : Stack(
                children: [
                  Camera(
                    widget.cameras,
                    _model,
                    setRecognitions,
                  ),
                  BndBox(
                      _recognitions == null ? [] : _recognitions!,
                      math.max(_imageHeight, _imageWidth),
                      math.min(_imageHeight, _imageWidth),
                      screen.height,
                      screen.width,
                      _model),
                ],
              ),
      ),
    );
  }
}
