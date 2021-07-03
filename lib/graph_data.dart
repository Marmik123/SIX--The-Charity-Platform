import 'package:flutter/material.dart';

class GraphData {
  final String yLabel;
  final double value;
  final String xLabel;
  final Color columnColor;

  GraphData({
    required this.yLabel,
    required this.xLabel,
    required this.value,
    required this.columnColor,
  });
}
