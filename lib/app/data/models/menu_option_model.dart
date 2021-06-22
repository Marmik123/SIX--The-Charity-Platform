import 'package:flutter/material.dart';

// Model class to hold menu option data (language and theme)
class MenuOptionsModel {
  final ThemeMode key;
  final String value;
  final IconData? icon;

  MenuOptionsModel({required this.key, required this.value, this.icon});
}
