/*
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class VoucherCard extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path_0 = Path();
    path_0.moveTo(size.width * 0.9846159, size.height * 0.6782822);
    path_0.lineTo(size.width * 0.9841184, size.height * 0.6791073);
    path_0.cubicTo(
        size.width * 0.9827333,
        size.height * 0.6814059,
        size.width * 0.9814269,
        size.height * 0.6835528,
        size.width * 0.9802010,
        size.height * 0.6855693);
    path_0.cubicTo(
        size.width * 0.9764249,
        size.height * 0.6917772,
        size.width * 0.9734149,
        size.height * 0.6967261,
        size.width * 0.9712299,
        size.height * 0.7008993);
    path_0.cubicTo(
        size.width * 0.9683612,
        size.height * 0.7063795,
        size.width * 0.9665920,
        size.height * 0.7110908,
        size.width * 0.9665920,
        size.height * 0.7161716);
    path_0.cubicTo(
        size.width * 0.9665920,
        size.height * 0.7212525,
        size.width * 0.9683612,
        size.height * 0.7259637,
        size.width * 0.9712299,
        size.height * 0.7314439);
    path_0.cubicTo(
        size.width * 0.9734149,
        size.height * 0.7356172,
        size.width * 0.9764249,
        size.height * 0.7405660,
        size.width * 0.9802010,
        size.height * 0.7467739);
    path_0.cubicTo(
        size.width * 0.9814269,
        size.height * 0.7487904,
        size.width * 0.9827333,
        size.height * 0.7509373,
        size.width * 0.9841184,
        size.height * 0.7532360);
    path_0.lineTo(size.width * 0.9846159, size.height * 0.7540611);
    path_0.cubicTo(
        size.width * 0.9934905,
        size.height * 0.7687789,
        size.width * 0.9985075,
        size.height * 0.7887756,
        size.width * 0.9985075,
        size.height * 0.8097360);
    path_0.lineTo(size.width * 0.9985075, size.height * 0.9174917);
    path_0.cubicTo(
        size.width * 0.9985075,
        size.height * 0.9616700,
        size.width * 0.9768876,
        size.height * 0.9975248,
        size.width * 0.9502488,
        size.height * 0.9975248);
    path_0.lineTo(size.width * 0.04975124, size.height * 0.9975248);
    path_0.cubicTo(
        size.width * 0.02311284,
        size.height * 0.9975248,
        size.width * 0.001492537,
        size.height * 0.9616700,
        size.width * 0.001492537,
        size.height * 0.9174917);
    path_0.lineTo(size.width * 0.001492537, size.height * 0.8089109);
    path_0.cubicTo(
        size.width * 0.001492537,
        size.height * 0.7881139,
        size.width * 0.006510338,
        size.height * 0.7679505,
        size.width * 0.01538378,
        size.height * 0.7532360);
    path_0.cubicTo(
        size.width * 0.01676886,
        size.height * 0.7509389,
        size.width * 0.01807542,
        size.height * 0.7487904,
        size.width * 0.01930119,
        size.height * 0.7467756);
    path_0.cubicTo(
        size.width * 0.02307721,
        size.height * 0.7405677,
        size.width * 0.02608766,
        size.height * 0.7356172,
        size.width * 0.02827254,
        size.height * 0.7314439);
    path_0.cubicTo(
        size.width * 0.03114169,
        size.height * 0.7259637,
        size.width * 0.03291045,
        size.height * 0.7212525,
        size.width * 0.03291045,
        size.height * 0.7161716);
    path_0.cubicTo(
        size.width * 0.03291045,
        size.height * 0.7110908,
        size.width * 0.03114169,
        size.height * 0.7063795,
        size.width * 0.02827254,
        size.height * 0.7008993);
    path_0.cubicTo(
        size.width * 0.02608766,
        size.height * 0.6967261,
        size.width * 0.02307721,
        size.height * 0.6917756,
        size.width * 0.01930119,
        size.height * 0.6855677);
    path_0.cubicTo(
        size.width * 0.01807542,
        size.height * 0.6835528,
        size.width * 0.01676886,
        size.height * 0.6814043,
        size.width * 0.01538378,
        size.height * 0.6791073);
    path_0.cubicTo(
        size.width * 0.006509204,
        size.height * 0.6643894,
        size.width * 0.001492537,
        size.height * 0.6443927,
        size.width * 0.001492537,
        size.height * 0.6234323);
    path_0.lineTo(size.width * 0.001492537, size.height * 0.08250825);
    path_0.cubicTo(
        size.width * 0.001492537,
        size.height * 0.03833069,
        size.width * 0.02311284,
        size.height * 0.002475248,
        size.width * 0.04975124,
        size.height * 0.002475248);
    path_0.lineTo(size.width * 0.9502488, size.height * 0.002475248);
    path_0.cubicTo(
        size.width * 0.9768876,
        size.height * 0.002475248,
        size.width * 0.9985075,
        size.height * 0.03833069,
        size.width * 0.9985075,
        size.height * 0.08250825);
    path_0.lineTo(size.width * 0.9985075, size.height * 0.6226073);
    path_0.cubicTo(
        size.width * 0.9985075,
        size.height * 0.6434043,
        size.width * 0.9934896,
        size.height * 0.6635677,
        size.width * 0.9846159,
        size.height * 0.6782822);
    path_0.close();

    var paint0Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.002985075;
    paint0Stroke.color = const Color(0xffE3FCFF).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Stroke);

    var paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
*/
