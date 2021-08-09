/*
// To parse this JSON data, do
//
//     final vendorDetails = vendorDetailsFromMap(jsonString);

import 'dart:convert';

import 'package:six/app/data/models/user_entity.dart';

class BeneficiaryListDetails {
  BeneficiaryListDetails({
    this.id,
    this.workerUserId,
    this.familyUserId,
    this.isActive,
    this.deleted,
    this.createdAt,
    this.updatedAt,
    this.familyUserForWorker,
  });

  String? id;
  String? workerUserId;
  String? familyUserId;
  bool? isActive;
  bool? deleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  FamilyUserForWorker? familyUserForWorker;

  BeneficiaryListDetails copyWith({
    String? id,
    String? workerUserId,
    String? familyUserId,
    bool? isActive,
    bool? deleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    FamilyUserForWorker? familyUserForWorker,
  }) =>
      BeneficiaryListDetails(
        id: id ?? this.id,
        workerUserId: workerUserId ?? this.workerUserId,
        familyUserId: familyUserId ?? this.familyUserId,
        isActive: isActive ?? this.isActive,
        deleted: deleted ?? this.deleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        familyUserForWorker: familyUserForWorker ?? this.familyUserForWorker,
      );

  factory BeneficiaryListDetails.fromJson(Map<String, dynamic> json) =>
      BeneficiaryListDetails.fromMap(json);

  @override
  String toString() => json.encode(toMap());

  factory BeneficiaryListDetails.fromMap(Map<String, dynamic> json) =>
      BeneficiaryListDetails(
        id: json['id'] == null ? null : json['id'] as String,
        workerUserId: json['worker_user_id'] == null
            ? null
            : json['worker_user_id'] as String,
        familyUserId: json['family_user_id'] == null
            ? null
            : json['family_user_id'] as String,
        isActive: json['is_active'] == null ? null : json['is_active'] as bool,
        deleted: json['_deleted'] == null ? null : json['_deleted'] as bool,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        familyUserForWorker: json['familyUserForWorker'] == null
            ? null
            : FamilyUserForWorker.fromMap(
                json['familyUserForWorker'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'worker_user_id': workerUserId,
        'family_user_id': familyUserId,
        'is_active': isActive,
        '_deleted': deleted,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'familyUserForWorker': familyUserForWorker,
      };
}

class FamilyUserForWorker {
  FamilyUserForWorker({
    this.id,
    this.profileImage,
    this.profileImageUrl,
    this.userMetadata,
  });

  String? id;
  dynamic profileImage;
  dynamic profileImageUrl;
  UserMetadata? userMetadata;

  FamilyUserForWorker copyWith({
    String? id,
    dynamic profileImage,
    dynamic profileImageUrl,
    UserMetadata? userMetadata,
  }) =>
      FamilyUserForWorker(
        id: id ?? this.id,
        profileImage: profileImage ?? this.profileImage,
        profileImageUrl: profileImageUrl ?? this.profileImageUrl,
        userMetadata: userMetadata ?? this.userMetadata,
      );

  factory FamilyUserForWorker.fromJson(Map<String, dynamic> json) =>
      FamilyUserForWorker.fromMap(json);

  String toJson() => json.encode(toMap());

  factory FamilyUserForWorker.fromMap(Map<String, dynamic> json) =>
      FamilyUserForWorker(
        id: json['id'] as String,
        profileImage: json['profile_image'],
        profileImageUrl: json['profile_image_url'],
        userMetadata: json['user_metadata'] == null
            ? null
            : UserMetadata.fromMap(
                json['user_metadata'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'profile_image': profileImage,
        'profile_image_url': profileImageUrl,
        'user_metadata': userMetadata == null ? null : userMetadata?.toMap(),
      };
}
*/
