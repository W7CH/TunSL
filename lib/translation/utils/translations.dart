class Translations {
  static final languages = ['English', 'French', 'Tunisian'];
  /*static final langflags = <String?, String>{
    'English': 'assets/English.png',
    'French': 'assets/French.png',
    'Tunisian': 'assets/Tunisian.png'
  };*/

  static String getLanguageCode(String? language) {
    switch (language) {
      case 'English':
        return 'en';
      case 'French':
        return 'fr';
      case 'Tunisian':
        return 'ar';
      default:
        return 'en';
    }
  }
}
