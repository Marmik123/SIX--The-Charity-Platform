// To parse this JSON data, do
//
//     final graphData = graphDataFromMap(jsonString);

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart' show Color;
import 'package:six/app/data/config/app_colors.dart';

class GraphData {
  GraphData({
    this.id,
    this.value,
    this.title,
    this.barColor,
  });
  String? id;
  double? value;
  String? title;
  Color? barColor;

  GraphData copyWith({
    String? id,
    double? value,
    String? title,
    Color? barColor,
  }) =>
      GraphData(
        id: id ?? this.id,
        value: value ?? this.value,
        title: title ?? this.title,
        barColor: barColor ?? this.barColor,
      );

  factory GraphData.fromJson(Map<String, dynamic> json) =>
      GraphData.fromMap(json);

  String toJson() => json.encode(toMap());

  factory GraphData.fromMap(Map<String, dynamic> json) {
    var totalBalance = double.tryParse(json['total_donation_left'].toString());
    var barColorList = <Color>[
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
    final random = Random();
    Color? currentColor;
    void shuffle() {
      if (barColorList.isNotEmpty) {
        barColorList.shuffle();
        currentColor = barColorList.removeLast();
      }
    }

    random.nextInt(barColorList.length);
    var setOfInts = <int>{};
    setOfInts.add(Random().nextInt(barColorList.length));
    return GraphData(
      id: json['id'] == null ? null : json['id'] as String,
      value: json['total_donation_left'] == null ? null : totalBalance,
      title: json['title'] == null ? null : json['title'] as String,
      barColor: currentColor,
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'total_donation_left': value,
        'title': title,
        'barColor': barColor,
      };
}
