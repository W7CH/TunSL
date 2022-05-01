import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;

import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

const String deeplab = "DeepLab";
const String tunsl = "TunSL";

class StaticDetection extends StatefulWidget {
  const StaticDetection({Key? key}) : super(key: key);

  @override
  _StaticDetectionState createState() => _StaticDetectionState();
}

class _StaticDetectionState extends State<StaticDetection> {
  File? _image;
  List? _recognitions;
  String _model = tunsl;
  late double _imageHeight;
  late double _imageWidth;
  bool _busy = false;

  Future predictImagePicker() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    setState(() {
      _busy = true;
    });
    predictImage(File(image.path));
  }

  Future predictImage(File image) async {
    switch (_model) {
      case tunsl:
        await recognizeImage(image);
        break;
      default:
        await recognizeImage(image);
      // await recognizeImageBinary(image);
    }

    FileImage(image)
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      setState(() {
        _imageHeight = info.image.height.toDouble();
        _imageWidth = info.image.width.toDouble();
      });
    }));

    setState(() {
      _image = image;
      _busy = false;
    });
  }

  @override
  void initState() {
    super.initState();

    _busy = true;

    loadModel().then((val) {
      setState(() {
        _busy = false;
      });
    });
  }

  Future loadModel() async {
    Tflite.close();
    try {
      String? res;
      switch (_model) {
        case deeplab:
          res = await Tflite.loadModel(
            model: "assets/deeplabv3_257_mv_gpu.tflite",
            labels: "assets/deeplabv3_257_mv_gpu.txt",
            // useGpuDelegate: true,
          );
          break;
        case tunsl:
          res = await Tflite.loadModel(
            model: "assets/model/tunsl_reduced.tflite",
            labels: "assets/model/labels1.txt",
            // useGpuDelegate: true,
          );
          break;
        default:
          res = await Tflite.loadModel(
            model: "assets/model/tunsl_reduced.tflite",
            labels: "assets/model/labels1.txt",
            // useGpuDelegate: true,
          );
      }
      print(res);
    } on PlatformException {
      //print('Failed to load model.');
    }
  }

  Uint8List imageToByteListFloat32(
      img.Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (img.getRed(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getGreen(pixel) - mean) / std;
        buffer[pixelIndex++] = (img.getBlue(pixel) - mean) / std;
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  Uint8List imageToByteListUint8(img.Image image, int inputSize) {
    var convertedBytes = Uint8List(1 * inputSize * inputSize * 3);
    var buffer = Uint8List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = img.getRed(pixel);
        buffer[pixelIndex++] = img.getGreen(pixel);
        buffer[pixelIndex++] = img.getBlue(pixel);
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  Future recognizeImage(File image) async {
    int startTime = DateTime.now().millisecondsSinceEpoch;
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _recognitions = recognitions!;
    });
    int endTime = DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");
  }

  Future recognizeImageBinary(File image) async {
    int startTime = DateTime.now().millisecondsSinceEpoch;
    var imageBytes = (await rootBundle.load(image.path)).buffer;
    img.Image oriImage = img.decodeJpg(imageBytes.asUint8List());
    img.Image resizedImage = img.copyResize(oriImage, height: 224, width: 224);
    var recognitions = await Tflite.runModelOnBinary(
      binary: imageToByteListFloat32(resizedImage, 224, 127.5, 127.5),
      numResults: 6,
      threshold: 0.05,
    );
    setState(() {
      _recognitions = recognitions!;
    });
    int endTime = DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");
  }

  Future yolov2Tiny(File image) async {
    int startTime = DateTime.now().millisecondsSinceEpoch;
    var recognitions = await Tflite.detectObjectOnImage(
      path: image.path,
      model: "YOLO",
      threshold: 0.3,
      imageMean: 0.0,
      imageStd: 255.0,
      numResultsPerClass: 1,
    );
    // var imageBytes = (await rootBundle.load(image.path)).buffer;
    // img.Image oriImage = img.decodeJpg(imageBytes.asUint8List());
    // img.Image resizedImage = img.copyResize(oriImage, 416, 416);
    // var recognitions = await Tflite.detectObjectOnBinary(
    //   binary: imageToByteListFloat32(resizedImage, 416, 0.0, 255.0),
    //   model: "YOLO",
    //   threshold: 0.3,
    //   numResultsPerClass: 1,
    // );
    setState(() {
      _recognitions = recognitions!;
    });
    int endTime = DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");
  }

  Future ssdMobileNet(File image) async {
    int startTime = DateTime.now().millisecondsSinceEpoch;
    var recognitions = await Tflite.detectObjectOnImage(
      path: image.path,
      numResultsPerClass: 1,
    );
    // var imageBytes = (await rootBundle.load(image.path)).buffer;
    // img.Image oriImage = img.decodeJpg(imageBytes.asUint8List());
    // img.Image resizedImage = img.copyResize(oriImage, 300, 300);
    // var recognitions = await Tflite.detectObjectOnBinary(
    //   binary: imageToByteListUint8(resizedImage, 300),
    //   numResultsPerClass: 1,
    // );
    setState(() {
      _recognitions = recognitions!;
    });
    int endTime = DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");
  }

  Future tunSL(File image) async {
    int startTime = DateTime.now().millisecondsSinceEpoch;
    var recognitions = await Tflite.detectObjectOnImage(
      path: image.path,
      numResultsPerClass: 1,
    );
    // var imageBytes = (await rootBundle.load(image.path)).buffer;
    // img.Image oriImage = img.decodeJpg(imageBytes.asUint8List());
    // img.Image resizedImage = img.copyResize(oriImage, 300, 300);
    // var recognitions = await Tflite.detectObjectOnBinary(
    //   binary: imageToByteListUint8(resizedImage, 300),
    //   numResultsPerClass: 1,
    // );
    setState(() {
      _recognitions = recognitions!;
    });
    int endTime = DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");
  }

  Future segmentMobileNet(File image) async {
    int startTime = DateTime.now().millisecondsSinceEpoch;
    var recognitions = await Tflite.runSegmentationOnImage(
      path: image.path,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _recognitions = recognitions!;
    });
    int endTime = DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}");
  }

  Future poseNet(File image) async {
    int startTime = DateTime.now().millisecondsSinceEpoch;
    var recognitions = await Tflite.runPoseNetOnImage(
      path: image.path,
      numResults: 2,
    );

    print(recognitions);

    setState(() {
      _recognitions = recognitions!;
    });
    int endTime = DateTime.now().millisecondsSinceEpoch;
    print("Inference took ${endTime - startTime}ms");
  }

  onSelect(model) async {
    setState(() {
      _busy = true;
      _model = model;
      _recognitions = [null];
    });
    await loadModel();

    if (_image != null) {
      predictImage(_image!);
    } else {
      setState(() {
        _busy = false;
      });
    }
  }

  List<Widget> renderBoxes(Size screen) {
    if (_recognitions == null) return [];

    double factorX = screen.width;
    double factorY = _imageHeight / _imageWidth * screen.width;
    Color blue = const Color.fromRGBO(37, 213, 253, 1.0);
    return _recognitions!.map((re) {
      return Positioned(
        left: re["rect"]["x"] * factorX,
        top: re["rect"]["y"] * factorY,
        width: re["rect"]["w"] * factorX,
        height: re["rect"]["h"] * factorY,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            border: Border.all(
              color: blue,
              width: 2,
            ),
          ),
          child: Text(
            "${re["detectedClass"]} ${(re["confidenceInClass"] * 100).toStringAsFixed(0)}%",
            style: TextStyle(
              background: Paint()..color = blue,
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> renderKeypoints(Size screen) {
    if (_recognitions == null) return [];

    double factorX = screen.width;
    double factorY = _imageHeight / _imageWidth * screen.width;

    var lists = <Widget>[];
    for (var re in _recognitions!) {
      var color = Color((Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);
      var list = re["keypoints"].values.map<Widget>((k) {
        return Positioned(
          left: k["x"] * factorX - 6,
          top: k["y"] * factorY - 6,
          width: 100,
          height: 12,
          child: Text(
            "● ${k["part"]}",
            style: TextStyle(
              color: color,
              fontSize: 12.0,
            ),
          ),
        );
      }).toList();

      lists.addAll(list);
    }

    return lists;
  }

  Uint8List _getImageBinary(dynamicList) {
    List<int> intList =
        dynamicList.cast<int>().toList(); //This is the magical line.
    Uint8List data = Uint8List.fromList(intList);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.maybeOf(context)!.size;
    List<Widget> stackChildren = [];

    if (_model == deeplab && _recognitions != null) {
      stackChildren.add(_image == null
          ? const Center(
              child: Text(
              'No image selected.',
              style: TextStyle(fontSize: 18, fontFamily: "LibreFranklin"),
            ))
          : Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      alignment: Alignment.center,
                      image: MemoryImage(_getImageBinary(_recognitions)),
                      fit: BoxFit.fill)),
              //height: screenSize.height*0.05,
              child: Opacity(opacity: 0.3, child: Image.file(_image!))));
    } else {
      stackChildren.add(_image == null
          ? const Text(
              'No image selected.',
              style: TextStyle(fontSize: 18, fontFamily: "LibreFranklin"),
            )
          : Image.file(_image!));
    }

    if (_model == tunsl) {
      stackChildren.add(Center(
        child: Column(
          children: _recognitions != null
              ? _recognitions!.map((res) {
                  return RichText(
                      text: TextSpan(
                    text: "${res["label"]}   ",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                    children: [
                      TextSpan(
                        text:
                            "%${(res["confidence"] * 100).toStringAsFixed(2)}",
                        style: const TextStyle(
                            color: Color(0xff231991),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ));
                }).toList()
              : [],
        ),
      ));
    }

    if (_busy) {
      stackChildren.add(const Opacity(
        child: ModalBarrier(dismissible: false, color: Colors.grey),
        opacity: 0.3,
      ));
      stackChildren.add(const Center(child: CircularProgressIndicator()));
    }

    return SafeArea(
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
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: screenSize.width,
                height: 80.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/logo2.png',
                          height: 40.0,
                          width: screenSize.width * 0.1,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          'TunSL',
                          style: TextStyle(
                              color: Color(0xff231991),
                              fontFamily: 'Merriweather',
                              fontSize: 20.0),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
              stackChildren[0],
              SizedBox(height: 20.0,),
              stackChildren[1],
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: predictImagePicker,
          tooltip: 'Pick Image',
          backgroundColor: const Color(0xff231991),
          child: const Icon(
            Icons.image,
          ),
        ),
      ),
    );
  }
}
