import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  red,
  indigo,
}

class ThemeNotifier extends ChangeNotifier {
  static final _themes = <AppTheme, ThemeData>{
    AppTheme.red: ThemeData(primarySwatch: Colors.red),
    AppTheme.indigo: ThemeData(primarySwatch: Colors.indigo),
  };

  // Private state :
  AppTheme _theme;

  ThemeNotifier({AppTheme? initialState})
      : _theme = initialState ?? AppTheme.indigo;

  // State getters :
  ThemeData get theme => ThemeNotifier._themes[_theme]!;
  AppTheme get themeKey => _theme;

  // Events
  void changeTheme(AppTheme theme) {
    _theme = theme;
    notifyListeners();
  }
}
