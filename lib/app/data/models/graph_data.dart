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
    ];
    final random = Random();

    return GraphData(
      id: json['id'] == null ? null : json['id'] as String,
      value: json['total_donation_left'] == null ? null : totalBalance,
      title: json['title'] == null ? null : json['title'] as String,
      barColor: barColorList[random.nextInt(barColorList.length)],
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'total_donation_left': value,
        'title': title,
        'barColor': barColor,
      };
}
