import 'package:flutter/material.dart';

// AppLocalizations.of(context).hello('John');

class L10n {
  static final all = [
    const Locale('en', 'US'),
    const Locale('sk', 'SK'),
    const Locale('fr', 'FR'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'fr':
        return '';
      case 'sk':
        return '';
      case 'en':
      default:
        return '';
    }
  }
}

// restart the app
