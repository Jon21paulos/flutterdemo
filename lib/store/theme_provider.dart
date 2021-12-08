import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  final String key = "theme";
  SharedPreferences? _prefs;
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _prefs!.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs()async {
    await _initPrefs();
    _prefs!.setBool(key, _darkTheme);
  }

}