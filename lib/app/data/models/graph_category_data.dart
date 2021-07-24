// To parse this JSON data, do
//
//     final graphCategoryData = graphCategoryDataFromMap(jsonString);

import 'dart:convert';

class GraphCategoryData {
  GraphCategoryData({
    this.name,
    this.totalBalance,
  });

  String? name;
  int? totalBalance;

  GraphCategoryData copyWith({
    String? name,
    int? totalBalance,
  }) =>
      GraphCategoryData(
        name: name ?? this.name,
        totalBalance: totalBalance ?? this.totalBalance,
      );

  factory GraphCategoryData.fromJson(Map<String, dynamic> json) =>
      GraphCategoryData.fromMap(json);

  String toJson() => json.encode(toMap());

  factory GraphCategoryData.fromMap(Map<String, dynamic> json) =>
      GraphCategoryData(
        name: json['name'] == null ? null : json['name'] as String,
        totalBalance:
            json['total_balance'] == null ? null : json['total_balance'] as int,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'total_balance': totalBalance,
      };
}
