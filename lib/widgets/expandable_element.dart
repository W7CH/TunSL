// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:tunsl/translation/translation_widget.dart';
import 'package:tunsl/translation/globals.dart' as globals;

class ExpandableElement extends StatelessWidget {
  late final Icon elementIcon;
  late final String elementText;

  ExpandableElement({required this.elementIcon, required this.elementText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        elementIcon,
        SizedBox(width: 60),
        Translator(
          text: elementText,
          fromLanguage: globals.fromLanguage,
          toLanguage: globals.toLanguage,
          builder: (translated) => Text(
            translated!,
            style: TextStyle(
                color: Color(0xffA5678E),
                fontFamily: 'Merriweather',
                fontSize: 18),
          ),
        ),
      ],
    );
  }
}
