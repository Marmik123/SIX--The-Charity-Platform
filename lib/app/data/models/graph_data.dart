// To parse this JSON data, do
//
//     final graphData = graphDataFromMap(jsonString);

import 'dart:convert';

class GraphData {
  GraphData({
    this.id,
    this.totalDonationLeft,
    this.title,
  });

  String? id;
  int? totalDonationLeft;
  String? title;

  GraphData copyWith({
    String? id,
    int? totalDonationLeft,
    String? title,
  }) =>
      GraphData(
        id: id ?? this.id,
        totalDonationLeft: totalDonationLeft ?? this.totalDonationLeft,
        title: title ?? this.title,
      );

  factory GraphData.fromJson(Map<String, dynamic> json) =>
      GraphData.fromMap(json);

  String toJson() => json.encode(toMap());

  factory GraphData.fromMap(Map<String, dynamic> json) => GraphData(
        id: json['id'] == null ? null : json['id'] as String,
        totalDonationLeft: json['total_donation_left'] == null
            ? null
            : json['total_donation_left'] as int,
        title: json['title'] == null ? null : json['title'] as String,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'total_donation_left': totalDonationLeft,
        'title': title,
      };
}
