import 'package:flutter/material.dart';
import 'package:six/app/data/config/app_colors.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class DialogVoucherRedeem extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9412670, size.height * 0.5444034);
    path_0.lineTo(size.width * 0.9417195, size.height * 0.5437884);
    path_0.cubicTo(
        size.width * 0.9500452,
        size.height * 0.5324723,
        size.width * 0.9547511,
        size.height * 0.5169742,
        size.width * 0.9547511,
        size.height * 0.5009840);
    path_0.lineTo(size.width * 0.9547511, size.height * 0.09840098);
    path_0.cubicTo(
        size.width * 0.9547511,
        size.height * 0.06445264,
        size.width * 0.9344796,
        size.height * 0.03690037,
        size.width * 0.9095023,
        size.height * 0.03690037);
    path_0.lineTo(size.width * 0.09049774, size.height * 0.03690037);
    path_0.cubicTo(
        size.width * 0.06552036,
        size.height * 0.03690037,
        size.width * 0.04524887,
        size.height * 0.06445264,
        size.width * 0.04524887,
        size.height * 0.09840098);
    path_0.lineTo(size.width * 0.04524887, size.height * 0.5015990);
    path_0.cubicTo(
        size.width * 0.04524887,
        size.height * 0.5177122,
        size.width * 0.04995475,
        size.height * 0.5330873,
        size.width * 0.05828054,
        size.height * 0.5444034);
    path_0.cubicTo(
        size.width * 0.07900452,
        size.height * 0.5725707,
        size.width * 0.07900452,
        size.height * 0.5688807,
        size.width * 0.05828054,
        size.height * 0.5970480);
    path_0.cubicTo(
        size.width * 0.04995475,
        size.height * 0.6083641,
        size.width * 0.04524887,
        size.height * 0.6238622,
        size.width * 0.04524887,
        size.height * 0.6398524);
    path_0.lineTo(size.width * 0.04524887, size.height * 0.8523985);
    path_0.cubicTo(
        size.width * 0.04524887,
        size.height * 0.8863469,
        size.width * 0.06552036,
        size.height * 0.9138991,
        size.width * 0.09049774,
        size.height * 0.9138991);
    path_0.lineTo(size.width * 0.9095023, size.height * 0.9138991);
    path_0.cubicTo(
        size.width * 0.9344796,
        size.height * 0.9138991,
        size.width * 0.9547511,
        size.height * 0.8863469,
        size.width * 0.9547511,
        size.height * 0.8523985);
    path_0.lineTo(size.width * 0.9547511, size.height * 0.6404674);
    path_0.cubicTo(
        size.width * 0.9547511,
        size.height * 0.6243542,
        size.width * 0.9500452,
        size.height * 0.6089791,
        size.width * 0.9417195,
        size.height * 0.5976630);
    path_0.lineTo(size.width * 0.9412670, size.height * 0.5970480);
    path_0.cubicTo(
        size.width * 0.9205430,
        size.height * 0.5688807,
        size.width * 0.9205430,
        size.height * 0.5725707,
        size.width * 0.9412670,
        size.height * 0.5444034);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.9407602, size.height * 0.5424834);
    path_1.lineTo(size.width * 0.9403077, size.height * 0.5430984);
    path_1.cubicTo(
        size.width * 0.9390498,
        size.height * 0.5448118,
        size.width * 0.9378552,
        size.height * 0.5464121,
        size.width * 0.9367421,
        size.height * 0.5479151);
    path_1.cubicTo(
        size.width * 0.9333122,
        size.height * 0.5525424,
        size.width * 0.9305701,
        size.height * 0.5562312,
        size.width * 0.9285882,
        size.height * 0.5593419);
    path_1.cubicTo(
        size.width * 0.9259729,
        size.height * 0.5634268,
        size.width * 0.9243620,
        size.height * 0.5669385,
        size.width * 0.9243620,
        size.height * 0.5707257);
    path_1.cubicTo(
        size.width * 0.9243620,
        size.height * 0.5745129,
        size.width * 0.9259729,
        size.height * 0.5780246,
        size.width * 0.9285882,
        size.height * 0.5821095);
    path_1.cubicTo(
        size.width * 0.9305701,
        size.height * 0.5852202,
        size.width * 0.9333122,
        size.height * 0.5889090,
        size.width * 0.9367421,
        size.height * 0.5935363);
    path_1.cubicTo(
        size.width * 0.9378552,
        size.height * 0.5950394,
        size.width * 0.9390498,
        size.height * 0.5966396,
        size.width * 0.9403077,
        size.height * 0.5983530);
    path_1.lineTo(size.width * 0.9407602, size.height * 0.5989680);
    path_1.cubicTo(
        size.width * 0.9488326,
        size.height * 0.6099385,
        size.width * 0.9533937,
        size.height * 0.6248438,
        size.width * 0.9533937,
        size.height * 0.6404674);
    path_1.lineTo(size.width * 0.9533937, size.height * 0.8523985);
    path_1.cubicTo(
        size.width * 0.9533937,
        size.height * 0.8853284,
        size.width * 0.9337285,
        size.height * 0.9120541,
        size.width * 0.9095023,
        size.height * 0.9120541);
    path_1.lineTo(size.width * 0.09049774, size.height * 0.9120541);
    path_1.cubicTo(
        size.width * 0.06627005,
        size.height * 0.9120541,
        size.width * 0.04660633,
        size.height * 0.8853284,
        size.width * 0.04660633,
        size.height * 0.8523985);
    path_1.lineTo(size.width * 0.04660633, size.height * 0.6398524);
    path_1.cubicTo(
        size.width * 0.04660633,
        size.height * 0.6243506,
        size.width * 0.05117005,
        size.height * 0.6093210,
        size.width * 0.05924045,
        size.height * 0.5983530);
    path_1.cubicTo(
        size.width * 0.06050018,
        size.height * 0.5966408,
        size.width * 0.06168851,
        size.height * 0.5950394,
        size.width * 0.06280335,
        size.height * 0.5935375);
    path_1.cubicTo(
        size.width * 0.06623765,
        size.height * 0.5889102,
        size.width * 0.06897566,
        size.height * 0.5852202,
        size.width * 0.07096281,
        size.height * 0.5821095);
    path_1.cubicTo(
        size.width * 0.07357231,
        size.height * 0.5780246,
        size.width * 0.07518100,
        size.height * 0.5745129,
        size.width * 0.07518100,
        size.height * 0.5707257);
    path_1.cubicTo(
        size.width * 0.07518100,
        size.height * 0.5669385,
        size.width * 0.07357231,
        size.height * 0.5634268,
        size.width * 0.07096281,
        size.height * 0.5593419);
    path_1.cubicTo(
        size.width * 0.06897566,
        size.height * 0.5562312,
        size.width * 0.06623765,
        size.height * 0.5525412,
        size.width * 0.06280335,
        size.height * 0.5479139);
    path_1.cubicTo(
        size.width * 0.06168851,
        size.height * 0.5464121,
        size.width * 0.06050018,
        size.height * 0.5448106,
        size.width * 0.05924045,
        size.height * 0.5430984);
    path_1.cubicTo(
        size.width * 0.05116905,
        size.height * 0.5321279,
        size.width * 0.04660633,
        size.height * 0.5172226,
        size.width * 0.04660633,
        size.height * 0.5015990);
    path_1.lineTo(size.width * 0.04660633, size.height * 0.09840098);
    path_1.cubicTo(
        size.width * 0.04660633,
        size.height * 0.06547159,
        size.width * 0.06627005,
        size.height * 0.03874539,
        size.width * 0.09049774,
        size.height * 0.03874539);
    path_1.lineTo(size.width * 0.9095023, size.height * 0.03874539);
    path_1.cubicTo(
        size.width * 0.9337285,
        size.height * 0.03874539,
        size.width * 0.9533937,
        size.height * 0.06547159,
        size.width * 0.9533937,
        size.height * 0.09840098);
    path_1.lineTo(size.width * 0.9533937, size.height * 0.5009840);
    path_1.cubicTo(
        size.width * 0.9533937,
        size.height * 0.5164859,
        size.width * 0.9488326,
        size.height * 0.5315154,
        size.width * 0.9407602,
        size.height * 0.5424834);
    path_1.close();

    Paint paint_1_stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.002714932;
    paint_1_stroke.color = Color(0xffE3FCFF).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_stroke);

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = AppColors.kffffff.withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
