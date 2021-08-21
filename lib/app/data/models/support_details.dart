// To parse this JSON data, do
//
//     final supportDetails = supportDetailsFromMap(jsonString);

import 'dart:convert';

class SupportDetails {
  SupportDetails({
    this.id,
    this.profileImage,
    this.profileImageUrl,
    this.singpassId,
    this.userMetadata,
    this.workerUser,
  });

  String? id;
  String? profileImage;
  String? profileImageUrl;
  String? singpassId;
  SupportDetailsUserMetadata? userMetadata;
  List<WorkerUser>? workerUser;

  SupportDetails copyWith({
    String? id,
    String? profileImage,
    String? profileImageUrl,
    String? singpassId,
    SupportDetailsUserMetadata? userMetadata,
    List<WorkerUser>? workerUser,
  }) =>
      SupportDetails(
        id: id ?? this.id,
        profileImage: profileImage ?? this.profileImage,
        profileImageUrl: profileImageUrl ?? this.profileImageUrl,
        singpassId: singpassId ?? this.singpassId,
        userMetadata: userMetadata ?? this.userMetadata,
        workerUser: workerUser ?? this.workerUser,
      );

  factory SupportDetails.fromJson(Map<String, dynamic> json) =>
      SupportDetails.fromMap(json);

  String toJson() => json.encode(toMap());

  factory SupportDetails.fromMap(Map<String, dynamic> json) => SupportDetails(
        id: json['id'] == null ? null : json['id'] as String,
        profileImage: json['profile_image'] == null
            ? null
            : json['profile_image'] as String,
        profileImageUrl: json['profile_image_url'] == null
            ? null
            : json['profile_image_url'] as String,
        singpassId:
            json['singpass_id'] == null ? null : json['singpass_id'] as String,
        userMetadata: json['user_metadata'] == null
            ? null
            : SupportDetailsUserMetadata.fromMap(
                json['user_metadata'] as Map<String, dynamic>),
        workerUser: json['workerUser'] == null
            ? null
            : List<WorkerUser>.from(json['workerUser'].map((dynamic x) =>
                    WorkerUser.fromMap(x as Map<String, dynamic>))
                as Iterable<dynamic>),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'profile_image': profileImage,
        'profile_image_url': profileImageUrl,
        'singpass_id': singpassId,
        'user_metadata': userMetadata == null ? null : userMetadata?.toMap(),
        'workerUser': workerUser == null
            ? null
            : List<dynamic>.from(
                workerUser?.map<dynamic>((x) => x.toMap()) ?? <dynamic>[]),
      };
}

class SupportDetailsUserMetadata {
  SupportDetailsUserMetadata({
    this.id,
    this.userId,
    this.principalName,
    this.email,
    this.mobileNumber,
  });

  String? id;
  String? userId;
  String? principalName;
  String? email;
  String? mobileNumber;

  SupportDetailsUserMetadata copyWith({
    String? id,
    String? userId,
    String? principalName,
    String? email,
    String? mobileNumber,
  }) =>
      SupportDetailsUserMetadata(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        principalName: principalName ?? this.principalName,
        email: email ?? this.email,
        mobileNumber: mobileNumber ?? this.mobileNumber,
      );

  factory SupportDetailsUserMetadata.fromJson(Map<String, dynamic> json) =>
      SupportDetailsUserMetadata.fromMap(json);

  String toJson() => json.encode(toMap());

  factory SupportDetailsUserMetadata.fromMap(Map<String, dynamic> json) =>
      SupportDetailsUserMetadata(
        id: json['id'] as String,
        userId: json['user_id'] as String,
        principalName: json['principal_name'] as String,
        email: json['email'] as String,
        mobileNumber: json['mobile_number'] as String,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'user_id': userId,
        'principal_name': principalName,
        'email': email,
        'mobile_number': mobileNumber,
      };
}

class WorkerUser {
  WorkerUser({
    this.charityUserId,
    this.charityUser,
  });

  String? charityUserId;
  CharityUser? charityUser;

  WorkerUser copyWith({
    String? charityUserId,
    CharityUser? charityUser,
  }) =>
      WorkerUser(
        charityUserId: charityUserId ?? this.charityUserId,
        charityUser: charityUser ?? this.charityUser,
      );

  factory WorkerUser.fromJson(Map<String, dynamic> json) =>
      WorkerUser.fromMap(json);

  String toJson() => json.encode(toMap());

  factory WorkerUser.fromMap(Map<String, dynamic> json) => WorkerUser(
        charityUserId: json['charity_user_id'] as String,
        charityUser: json['charityUser'] == null
            ? null
            : CharityUser.fromMap(json['charityUser'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'charity_user_id': charityUserId,
        'charityUser': charityUser == null ? null : charityUser?.toMap(),
      };
}

class CharityUser {
  CharityUser({
    this.id,
    this.firstName,
    this.userMetadata,
  });

  String? id;
  String? firstName;
  CharityUserUserMetadata? userMetadata;

  CharityUser copyWith({
    String? id,
    String? firstName,
    CharityUserUserMetadata? userMetadata,
  }) =>
      CharityUser(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        userMetadata: userMetadata ?? this.userMetadata,
      );

  factory CharityUser.fromJson(Map<String, dynamic> json) =>
      CharityUser.fromMap(json);

  String toJson() => json.encode(toMap());

  factory CharityUser.fromMap(Map<String, dynamic> json) => CharityUser(
        id: json['id'] as String,
        firstName: json['first_name'] as String,
        userMetadata: json['user_metadata'] == null
            ? null
            : CharityUserUserMetadata.fromMap(
                json['user_metadata'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'first_name': firstName,
        'user_metadata': userMetadata == null ? null : userMetadata?.toMap(),
      };
}

class CharityUserUserMetadata {
  CharityUserUserMetadata({
    this.entityName,
  });

  String? entityName;

  CharityUserUserMetadata copyWith({
    String? entityName,
  }) =>
      CharityUserUserMetadata(
        entityName: entityName ?? this.entityName,
      );

  factory CharityUserUserMetadata.fromJson(Map<String, dynamic> json) =>
      CharityUserUserMetadata.fromMap(json);

  String toJson() => json.encode(toMap());

  factory CharityUserUserMetadata.fromMap(Map<String, dynamic> json) =>
      CharityUserUserMetadata(
        entityName: json['entity_name'] as String,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'entity_name': entityName,
      };
}
