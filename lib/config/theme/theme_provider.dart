import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode {
    return getThemeMode(_themeMode.name);
  }

  ThemeMode get appThemeMode => _themeMode;

  BuildContext context;

  ThemeProvider(this.context) {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String themeModeString = prefs.getString('themeMode') ?? 'system';
    _themeMode = ThemeMode.values.firstWhere(
      (mode) => mode.toString() == 'ThemeMode.$themeModeString',
      orElse: () => ThemeMode.system,
    );

    notifyListeners();
  }

  Future<void> toggleTheme(ThemeMode mode) async {
    _themeMode = mode;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', mode.toString().split('.').last);

    notifyListeners();
  }

  ThemeMode getThemeMode(String themeMode) {
    switch (themeMode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        final brightness = MediaQuery.platformBrightnessOf(context);
        if (brightness == Brightness.light) {
          return ThemeMode.light;
        } else {
          return ThemeMode.dark;
        }
      default:
        return ThemeMode.light;
    }
  }
}

enum ThemeModeEnum {
  system,
  dark,
  light,
}
