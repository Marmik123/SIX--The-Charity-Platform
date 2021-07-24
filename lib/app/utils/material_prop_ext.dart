import 'package:flutter/material.dart';

extension MaterialPropExtension<T> on T {
  MaterialStateProperty<T> get msp => MaterialStateProperty.all<T>(this);
}
