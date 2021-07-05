import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  red,
  indigo,
}

class ThemeNotifier extends ChangeNotifier {
  static final _themes = <AppTheme, ThemeData>{
    AppTheme.red: ThemeData(
      primarySwatch: Colors.red,
      accentColor: Colors.amber,
      textTheme: TextTheme(
        button: const TextStyle(
          fontSize: 16,
        ),
        headline3: ThemeData.light().textTheme.headline3!.copyWith(
              color: Colors.pink[900],
            ),
      ),
    ),
    AppTheme.indigo: ThemeData(
      primarySwatch: Colors.indigo,
      accentColor: Colors.blue,
      textTheme: TextTheme(
        headline3: ThemeData.light().textTheme.headline3!.copyWith(
              color: Colors.indigo[900],
            ),
      ),
    ),
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
