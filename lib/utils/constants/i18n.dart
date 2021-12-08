import 'package:flutter/material.dart';

class I18n{
  static final all=[
    const Locale('am'),
    const Locale('en'),
    const Locale('es')
  ];

  static String getLanguage(String code) {
    switch (code) {
      case 'am':
        return 'አማርኛ';
      case 'es':
        return 'Oromifa';
      default:
        return 'English';
    }
  }
}

