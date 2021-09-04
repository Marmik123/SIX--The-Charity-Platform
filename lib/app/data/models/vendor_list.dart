// To parse this JSON data, do
//
//     final vendorList = vendorListFromMap(jsonString);
import 'dart:convert';

class VendorList {
  VendorList({
    required this.id,
    this.firstName,
    this.profileImage,
    this.profileImageUrl,
  });

  String id;
  String? firstName;
  String? profileImage;
  String? profileImageUrl;

  VendorList copyWith({
    String? id,
    String? firstName,
    String? profileImage,
    String? profileImageUrl,
  }) =>
      VendorList(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        profileImage: profileImage ?? this.profileImage,
        profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      );

  factory VendorList.fromJson(Map<String, dynamic> json) =>
      VendorList.fromMap(json);

  String toJson() => json.encode(toMap());

  factory VendorList.fromMap(Map<String, dynamic> json) => VendorList(
        id: json['id'] as String,
        firstName:
            json['first_name'] == null ? null : json['first_name'] as String,
        profileImage: json['profile_image'] == null
            ? null
            : json['profile_image'] as String,
        profileImageUrl: json['profile_image_url'] == null
            ? null
            : json['profile_image_url'] as String,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'first_name': firstName,
        'profile_image': profileImage,
        'profile_image_url': profileImageUrl,
      };
}
