import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class VendorHomeCurved extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path_0 = Path();
    path_0.moveTo(size.width * 0.9502488, 0);
    path_0.lineTo(size.width * 0.7293532, 0);
    path_0.cubicTo(
        size.width * 0.7144279,
        0,
        size.width * 0.7007960,
        size.height * 0.01338983,
        size.width * 0.6927363,
        size.height * 0.03491525);
    path_0.cubicTo(
        size.width * 0.6856716,
        size.height * 0.05372881,
        size.width * 0.6732338,
        size.height * 0.06610169,
        size.width * 0.6592040,
        size.height * 0.06610169);
    path_0.lineTo(size.width * 0.3407960, size.height * 0.06610169);
    path_0.cubicTo(
        size.width * 0.3267662,
        size.height * 0.06610169,
        size.width * 0.3143284,
        size.height * 0.05372881,
        size.width * 0.3072637,
        size.height * 0.03491525);
    path_0.cubicTo(size.width * 0.2992040, size.height * 0.01338983,
        size.width * 0.2855721, 0, size.width * 0.2706468, 0);
    path_0.lineTo(size.width * 0.04975124, 0);
    path_0.cubicTo(size.width * 0.02228856, 0, 0, size.height * 0.03796610, 0,
        size.height * 0.08474576);
    path_0.lineTo(0, size.height * 0.9152542);
    path_0.cubicTo(0, size.height * 0.9620339, size.width * 0.02228856,
        size.height, size.width * 0.04975124, size.height);
    path_0.lineTo(size.width * 0.9502488, size.height);
    path_0.cubicTo(size.width * 0.9777114, size.height, size.width,
        size.height * 0.9620339, size.width, size.height * 0.9152542);
    path_0.lineTo(size.width, size.height * 0.08474576);
    path_0.cubicTo(size.width, size.height * 0.03796610, size.width * 0.9777114,
        0, size.width * 0.9502488, 0);
    path_0.close();

    var paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.1980100, size.height * -0.00002217271),
        Offset(size.width * 1.885075, size.height * 2.289831),
        [const Color(0xff1FAF9E).withOpacity(1), const Color(0xff0087FF).withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
