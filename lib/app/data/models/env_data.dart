// To parse this JSON data, do
//
//     final envData = envDataFromMap(jsonString);

import 'dart:convert';

class EnvData {
  EnvData({
    required this.status,
    required this.clientId,
    required this.redirectUrl,
    required this.authApiUrl,
    required this.attributes,
    required this.authLevel,
  });

  String status;
  String clientId;
  String redirectUrl;
  String authApiUrl;
  String attributes;
  String authLevel;

  EnvData copyWith({
    String? status,
    String? clientId,
    String? redirectUrl,
    String? authApiUrl,
    String? attributes,
    String? authLevel,
  }) =>
      EnvData(
        status: status ?? this.status,
        clientId: clientId ?? this.clientId,
        redirectUrl: redirectUrl ?? this.redirectUrl,
        authApiUrl: authApiUrl ?? this.authApiUrl,
        attributes: attributes ?? this.attributes,
        authLevel: authLevel ?? this.authLevel,
      );

  factory EnvData.fromJson(String str) =>
      EnvData.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory EnvData.fromMap(Map<String, dynamic> json) => EnvData(
        status: json['status'] as String,
        clientId: json['clientId'] as String,
        redirectUrl: json['redirectUrl'] as String,
        authApiUrl: json['authApiUrl'] as String,
        attributes: json['attributes'] as String,
        authLevel: json['authLevel'] as String,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'status': status,
        'clientId': clientId,
        'redirectUrl': redirectUrl,
        'authApiUrl': authApiUrl,
        'attributes': attributes,
        'authLevel': authLevel,
      };
}
