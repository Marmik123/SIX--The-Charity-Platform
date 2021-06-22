import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_starter_kit/app/data/local/storage_keys.dart';

class ThemeProvider {
  static ThemeMode _theme = ThemeMode.system;
  static late ThemeMode _themeMode;

  static ThemeMode get themeMode => _themeMode;
  static ThemeMode get currentTheme => _theme;

  static Future<void> setThemeMode(ThemeMode value) async {
    _theme = value;
    _themeMode = getThemeMode(value);
    Get.changeThemeMode(_themeMode);
    await GetStorage().write(StorageKeys.themeKey, value.index);
  }

  static ThemeMode getThemeMode(ThemeMode themeMode) {
    var _setThemeMode = ThemeMode.system;
    switch (themeMode) {
      case ThemeMode.system:
        _setThemeMode = ThemeMode.system;
        break;
      case ThemeMode.dark:
        _setThemeMode = ThemeMode.dark;
        break;
      case ThemeMode.light:
        _setThemeMode = ThemeMode.light;
        break;
      default:
        _setThemeMode = ThemeMode.system;
    }

    return _setThemeMode;
  }

  static Future<void> getThemeModeFromStore() async {
    var _storedTheme = GetStorage().read<int>(StorageKeys.themeKey) ?? 0;
    await setThemeMode(ThemeMode.values[_storedTheme]);
  }

  // checks whether darkmode is set via system or previously by user
  static bool get isDarkModeOn {
    if (currentTheme == ThemeMode.system) {
      if (Get.isPlatformDarkMode) {
        return true;
      }
    }
    if (currentTheme == ThemeMode.dark) {
      return true;
    }
    return false;
  }
}
