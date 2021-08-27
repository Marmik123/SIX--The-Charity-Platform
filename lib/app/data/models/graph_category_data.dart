// To parse this JSON data, do
//
//     final graphCategoryData = graphCategoryDataFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:six/app/utils/color_ext.dart';

/* This Model is also used for displaying
 Available Credits Screen present in home screen of all modules.*/

class GraphCategoryData {
  GraphCategoryData({
    this.id,
    this.name,
    this.icon,
    this.value,
    this.profileUrl,
    this.barColor,
  });

  String? id;
  String? name;
  String? icon;
  String? profileUrl;
  double? value;
  Color? barColor;

  GraphCategoryData copyWith({
    String? id,
    String? name,
    String? icon,
    String? profileUrl,
    double? value,
    Color? barColor,
  }) =>
      GraphCategoryData(
        id: id ?? this.id,
        name: name ?? this.name,
        value: value ?? this.value,
        icon: icon ?? this.icon,
        profileUrl: profileUrl ?? this.profileUrl,
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
      value: json['value'] == null
          ? (json['total'] == null
              ? null
              : double.tryParse(json['total'].toString()))
          : value,
      icon: json['icon'] == null ? null : json['icon'] as String,
      profileUrl: json['profile_image_url'] == null
          ? null
          : json['profile_image_url'] as String,
      barColor: json['colour'] == null
          ? barColor
          : HexColor.fromHex(json['colour'] as String),
    );
  }

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'value': value,
        'icon': icon,
        'bar_color': barColor,
        'profile_image_url': profileUrl,
      };
}
