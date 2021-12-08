import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simpleproject/utils/constants/i18n.dart';

class LocaleProvider extends ChangeNotifier {
  final String key = "localization";
  Locale? _locale ;
  Locale? get locale => _locale;
  SharedPreferences? _prefs;

  LocaleProvider(){
    // _locale = locale;
    _loadFromPrefs();
  }
  void setLocale(Locale locale) {
    if (!I18n.all.contains(locale)) return;
    _locale = locale;
    _saveToPrefs();
    notifyListeners();
  }
  _initPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    String local = _prefs!.getString(key) ?? 'en';
    _locale = Locale(local);
    notifyListeners();
  }

  _saveToPrefs()async {
    await _initPrefs();
    _prefs!.setString(key, _locale.toString());
  }
}