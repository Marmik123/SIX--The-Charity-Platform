import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class CurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9502488, 0);
    path_0.lineTo(size.width * 0.7293532, 0);
    path_0.cubicTo(
        size.width * 0.7144279,
        0,
        size.width * 0.7007960,
        size.height * 0.03590909,
        size.width * 0.6927363,
        size.height * 0.09363636);
    path_0.cubicTo(
        size.width * 0.6856716,
        size.height * 0.1440909,
        size.width * 0.6732338,
        size.height * 0.1772727,
        size.width * 0.6592040,
        size.height * 0.1772727);
    path_0.lineTo(size.width * 0.3407960, size.height * 0.1772727);
    path_0.cubicTo(
        size.width * 0.3267662,
        size.height * 0.1772727,
        size.width * 0.3143284,
        size.height * 0.1440909,
        size.width * 0.3072637,
        size.height * 0.09363636);
    path_0.cubicTo(size.width * 0.2992040, size.height * 0.03590909,
        size.width * 0.2855721, 0, size.width * 0.2706468, 0);
    path_0.lineTo(size.width * 0.04975124, 0);
    path_0.cubicTo(size.width * 0.02228856, 0, 0, size.height * 0.1018182, 0,
        size.height * 0.2272727);
    path_0.lineTo(0, size.height * 0.7727273);
    path_0.cubicTo(0, size.height * 0.8981818, size.width * 0.02228856,
        size.height, size.width * 0.04975124, size.height);
    path_0.lineTo(size.width * 0.9502488, size.height);
    path_0.cubicTo(size.width * 0.9777114, size.height, size.width,
        size.height * 0.8981818, size.width, size.height * 0.7727273);
    path_0.lineTo(size.width, size.height * 0.2272727);
    path_0.cubicTo(size.width, size.height * 0.1018182, size.width * 0.9777114,
        0, size.width * 0.9502488, 0);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
      Offset(size.width * 97.263731, size.height * -141.81773),
      Offset(size.width * 102.614428, size.height * 125.522727),
      [Color(0xff1FAF9E).withOpacity(1), Color(0xff0087FF).withOpacity(1)],
      [0.3, 0.6],
    );
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
