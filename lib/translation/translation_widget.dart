// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'api/translation_api.dart';
import 'utils/translations.dart';

class Translator extends StatefulWidget {
  final String text;
  final String? fromLanguage;
  final String? toLanguage;
  final Widget Function(String? translation) builder;
  //builder: Widget Function(String) containing the result of translation

  const Translator({
    required this.text,
    required this.fromLanguage,
    required this.toLanguage,
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  _TranslatorState createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  String? translation;
  /*Either "translation" is marked nullable "?", or the "late" keyword is used
  and the null comparison in buildWaiting() is removed*/

  @override
  Widget build(BuildContext context) {
    //Use of Translations class to get the language code
    final fromLanguageCode = Translations.getLanguageCode(widget.fromLanguage);
    final toLanguageCode = Translations.getLanguageCode(widget.toLanguage);

    return FutureBuilder(
      //Use of TranslationApi class to translate the text
      future: TranslationApi.translate(
          widget.text, fromLanguageCode, toLanguageCode),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return buildWaiting();
          default:
            if (snapshot.hasError) {
              translation = 'Checking Network!';
            } else {
              translation = snapshot.data;
            }
            return widget.builder(translation);
        }
      },
    );
  }

  Widget buildWaiting() =>
      translation == null ? Text('') : widget.builder(translation);
}
