// To parse this JSON data, do
//
//     final graphCategoryData = graphCategoryDataFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:six/app/utils/color_ext.dart';

class GraphCategoryData {
  GraphCategoryData({
    this.id,
    this.name,
    this.value,
    this.barColor,
  });

  String? id;
  String? name;
  double? value;
  Color? barColor;

  GraphCategoryData copyWith({
    String? id,
    String? name,
    double? value,
    Color? barColor,
  }) =>
      GraphCategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
        value: value ?? this.value,
        barColor: barColor ?? this.barColor,
      );

  factory GraphCategoryData.fromJson(
          Map<String, dynamic> json, Color? barColor) =>
      GraphCategoryData.fromMap(json, barColor);

  String toJson() => json.encode(toMap());

  factory GraphCategoryData.fromMap(
    Map<String, dynamic> json,
    Color? barColor,
  ) {
    var value = double.tryParse(json['value'].toString());

    return GraphCategoryData(
      id: json['id'] == null ? null : json['id'] as String,
      name: json['name'] == null ? null : json['name'] as String,
      value: json['value'] == null ? null : value,
      barColor: json['colour'] == null
          ? barColor
          : HexColor.fromHex(json['colour'] as String),
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'value': value,
        'bar_color': barColor,
      };
}
