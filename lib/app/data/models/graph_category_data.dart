// To parse this JSON data, do
//
//     final graphCategoryData = graphCategoryDataFromMap(jsonString);

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:six/app/data/config/app_colors.dart';

class GraphCategoryData {
  GraphCategoryData({
    this.name,
    this.totalBalance,
    this.barColor,
  });

  String? name;
  double? totalBalance;
  Color? barColor;

  GraphCategoryData copyWith({
    String? name,
    double? totalBalance,
    Color? barColor,
  }) =>
      GraphCategoryData(
        name: name ?? this.name,
        totalBalance: totalBalance ?? this.totalBalance,
        barColor: barColor ?? this.barColor,
      );

  factory GraphCategoryData.fromJson(Map<String, dynamic> json) =>
      GraphCategoryData.fromMap(json);

  String toJson() => json.encode(toMap());

  factory GraphCategoryData.fromMap(Map<String, dynamic> json) {
    var totalBalance = double.tryParse(json['total_balance'].toString());
    var barColorList = <Color>[
      AppColors.k13A89E,
      AppColors.kFF9871,
      AppColors.kFF007A,
      AppColors.kFFD85E,
    ];
    final random = Random();

    return GraphCategoryData(
      name: json['name'] == null ? null : json['name'] as String,
      totalBalance: json['total_balance'] == null ? null : totalBalance,
      barColor: barColorList[random.nextInt(barColorList.length)],
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'total_balance': totalBalance,
        'bar_color': barColor,
      };
}
