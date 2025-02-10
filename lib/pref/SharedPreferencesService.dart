
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {

  static const String _currentLanguage = "currentLanguage";
  static const String _currentTheme = "currentTheme";


  static Future<SharedPreferences> _getInstance() async {
    return await SharedPreferences.getInstance();
  }

  // Save a language value
  static Future<void> saveLanguage(String value) async {
    final prefs = await _getInstance();
    await prefs.setString(_currentLanguage, value);
  }

  // Get a language value
  static Future<String?> getLanguage() async {
    final prefs = await _getInstance();
    return prefs.getString(_currentLanguage);
  }


  // Save a language value
  static Future<void> saveTheme(String value) async {
    final prefs = await _getInstance();
    await prefs.setString(_currentTheme, value);
  }

  // Get a language value
  static Future<String?> getTheme() async {
    final prefs = await _getInstance();
    return prefs.getString(_currentTheme);
  }

  // Clear all data
  static Future<void> clear() async {
    final prefs = await _getInstance();
    await prefs.clear();
  }


}
