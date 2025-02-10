
import 'dart:ui';

enum LanguagesSupported {
  english('English', 'en', 'US'),
  urdu('Urdu', 'ur', 'PK'),
  defaultLang('Default', 'en', 'US');

  final String name;
  final String languageCode;
  final String countryCode;

  const LanguagesSupported(this.name, this.languageCode, this.countryCode);

  static LanguagesSupported fromName(String name) {
    return LanguagesSupported.values.firstWhere(
          (lang) => lang.name == name,
      orElse: () => LanguagesSupported.defaultLang, // Fallback to Default
    );
  }

  Locale get locale => Locale(languageCode, countryCode);


}
