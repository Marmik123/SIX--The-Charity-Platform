import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class CategoryContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.04444444, size.height * 0.2218660);
    path_0.cubicTo(
        size.width * 0.04444444,
        size.height * 0.1468590,
        size.width * 0.1049562,
        size.height * 0.09109613,
        size.width * 0.1684524,
        size.height * 0.1053369);
    path_0.cubicTo(
        size.width * 0.2647822,
        size.height * 0.1269410,
        size.width * 0.3985933,
        size.height * 0.1520619,
        size.width * 0.5000000,
        size.height * 0.1520619);
    path_0.cubicTo(
        size.width * 0.6014067,
        size.height * 0.1520619,
        size.width * 0.7352178,
        size.height * 0.1269410,
        size.width * 0.8315467,
        size.height * 0.1053369);
    path_0.cubicTo(
        size.width * 0.8950444,
        size.height * 0.09109613,
        size.width * 0.9555556,
        size.height * 0.1468590,
        size.width * 0.9555556,
        size.height * 0.2218660);
    path_0.lineTo(size.width * 0.9555556, size.height * 0.8840206);
    path_0.cubicTo(
        size.width * 0.9555556,
        size.height * 0.9480747,
        size.width * 0.9107844,
        size.height,
        size.width * 0.8555556,
        size.height);
    path_0.lineTo(size.width * 0.1444444, size.height);
    path_0.cubicTo(
        size.width * 0.08921600,
        size.height,
        size.width * 0.04444444,
        size.height * 0.9480747,
        size.width * 0.04444444,
        size.height * 0.8840206);
    path_0.lineTo(size.width * 0.04444444, size.height * 0.2218660);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.04666667, size.height * 0.2218660);
    path_1.cubicTo(
        size.width * 0.04666667,
        size.height * 0.1485436,
        size.width * 0.1058500,
        size.height * 0.09392165,
        size.width * 0.1680304,
        size.height * 0.1078673);
    path_1.cubicTo(
        size.width * 0.2643711,
        size.height * 0.1294737,
        size.width * 0.3983644,
        size.height * 0.1546392,
        size.width * 0.5000000,
        size.height * 0.1546392);
    path_1.cubicTo(
        size.width * 0.6016356,
        size.height * 0.1546392,
        size.width * 0.7356289,
        size.height * 0.1294737,
        size.width * 0.8319689,
        size.height * 0.1078673);
    path_1.cubicTo(
        size.width * 0.8941511,
        size.height * 0.09392165,
        size.width * 0.9533333,
        size.height * 0.1485436,
        size.width * 0.9533333,
        size.height * 0.2218660);
    path_1.lineTo(size.width * 0.9533333, size.height * 0.8840206);
    path_1.cubicTo(
        size.width * 0.9533333,
        size.height * 0.9466521,
        size.width * 0.9095578,
        size.height * 0.9974227,
        size.width * 0.8555556,
        size.height * 0.9974227);
    path_1.lineTo(size.width * 0.1444444, size.height * 0.9974227);
    path_1.cubicTo(
        size.width * 0.09044333,
        size.height * 0.9974227,
        size.width * 0.04666667,
        size.height * 0.9466521,
        size.width * 0.04666667,
        size.height * 0.8840206);
    path_1.lineTo(size.width * 0.04666667, size.height * 0.2218660);
    path_1.close();

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.004444444;
    paint_1_stroke.shader = ui.Gradient.linear(
        Offset(size.width * 0.5000000, size.height * 0.1456186),
        Offset(size.width * 0.5000000, size.height), [
      Color(0xffFF007A).withOpacity(0),
      Color(0xffFF007A).withOpacity(0.1),
      Color(0xffFF007A).withOpacity(0.15)
    ], [
      0,
      0.489583,
      1
    ]);
    canvas.drawPath(path_1, paint_1_stroke);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xffffff).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
