import 'package:translator/translator.dart';

class TranslationApi {
  static Future<String> translate(
      String text, String fromLanguageCode, String toLanguageCode) async {
    final translation = await GoogleTranslator().translate(
      text,
      from: fromLanguageCode,
      to: toLanguageCode,
    );
    return translation.text;
  }
}
