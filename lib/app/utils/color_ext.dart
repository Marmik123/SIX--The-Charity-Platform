import 'dart:ui';

import 'package:six/app/data/config/app_colors.dart';
import 'package:six/app/data/config/error_handling.dart';

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

Color getBarColor(int index) {
  try {
    return _barColorList[index];
  } on Exception catch (e, t) {
    letMeHandleAllErrors(e, t);
    return AppColors.k13A89E;
  }
}

List<Color> _barColorList = <Color>[
  AppColors.k13A89E,
  AppColors.kFF9871,
  AppColors.kFF007A,
  AppColors.kFFD85E,
  const Color(0xFFdb0d17),
  const Color(0xFFff9901),
  const Color(0xFF00c2ff),
  const Color(0xFF000000),
  const Color(0xFFC0C0C0),
  const Color(0xFF808080),
  const Color(0xFF800000),
  const Color(0xFFFFFF00),
  const Color(0xFF808000),
  const Color(0xFF00FF00),
  const Color(0xFF00FFFF),
  const Color(0xFFFF00FF),
  const Color(0xFF800080),
  const Color(0xFF000080),
  const Color(0xFF177245),
  const Color(0xFF00703C),
  const Color(0xFFDE5285),
  const Color(0xFFFFA700),
  const Color(0xFF013220),
  const Color(0xFF006400),
  const Color(0xFF03C03C),
  const Color(0xFF00BFFF),
  const Color(0xFF00FF00),
  const Color(0xFFE95C4B),
  const Color(0xFFCC397B),
  const Color(0xFF00CC99),
];
