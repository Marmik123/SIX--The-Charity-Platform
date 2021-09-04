// To parse this JSON data, do
//
//     final voucherCategory = voucherCategoryFromMap(jsonString);
import 'dart:convert';

class VoucherCategory {
  VoucherCategory({
    required this.name,
    this.forground,
    this.background,
    this.accent,
    this.iconName,
    this.iconUrl,
    required this.id,
  });

  String name;
  String? forground;
  String? background;
  String? accent;
  String? iconName;
  String? iconUrl;
  String id;

  VoucherCategory copyWith({
    String? name,
    String? forground,
    String? background,
    String? accent,
    String? iconName,
    String? iconUrl,
    String? id,
  }) =>
      VoucherCategory(
        name: name ?? this.name,
        forground: forground ?? this.forground,
        background: background ?? this.background,
        accent: accent ?? this.accent,
        iconName: iconName ?? this.iconName,
        iconUrl: iconUrl ?? this.iconUrl,
        id: id ?? this.id,
      );

  factory VoucherCategory.fromJson(Map<String, dynamic> json) =>
      VoucherCategory.fromMap(json);

  String toJson() => json.encode(toMap());

  factory VoucherCategory.fromMap(Map<String, dynamic> json) => VoucherCategory(
        name: json['name'] == null ? '' : json['name'] as String,
        forground:
            json['forground'] == null ? null : json['forground'] as String,
        background:
            json['background'] == null ? null : json['background'] as String,
        accent: json['accent'] == null ? null : json['accent'] as String,
        iconName:
            json['icon_name'] == null ? null : json['icon_name'] as String,
        iconUrl: json['icon_url'] == null ? null : json['icon_url'] as String,
        id: json['id'] as String,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'forground': forground,
        'background': background,
        'accent': accent,
        'icon_name': iconName,
        'icon_url': iconUrl,
        'id': id,
      };
}
