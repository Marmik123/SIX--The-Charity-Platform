import 'package:flutter/material.dart';
//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class HighlightEllipse extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xffD5FAFF).withOpacity(1.0);
    canvas.drawCircle(Offset(size.width * 0.5000000, size.height * 0.5000000),
        size.width * 0.5000000, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
