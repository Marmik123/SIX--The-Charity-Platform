// To parse this JSON data, do
//
//     final userEntity = userEntityFromMap(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

class UserEntity {
  UserEntity({
    required this.id,
    this.singpassId,
    this.corppassId,
    this.role,
    this.profileImage,
    this.profileImageUrl,
    this.thumbProfileImage,
    this.thumbProfileImageUrl,
    this.walletBalance,
    this.referalCode,
    this.loginWith,
    this.categories,
    this.categorieIds,
    this.charities,
    this.charityIds,
    this.workers,
    this.workerIds,
    this.userMetadata,
  });

  String id;
  String? singpassId;
  String? corppassId;
  String? role;
  String? profileImage;
  String? profileImageUrl;
  String? thumbProfileImage;
  String? thumbProfileImageUrl;
  double? walletBalance;
  String? referalCode;
  String? loginWith;
  String? categories;
  String? categorieIds;
  dynamic charities;
  dynamic charityIds;
  dynamic workers;
  dynamic workerIds;
  UserMetadata? userMetadata;

  UserEntity copyWith({
    String? id,
    String? singpassId,
    String? corppassId,
    String? role,
    Map<String, dynamic>? userData,
    String? profileImage,
    String? profileImageUrl,
    String? thumbProfileImage,
    String? thumbProfileImageUrl,
    double? walletBalance,
    String? referalCode,
    String? loginWith,
    String? categories,
    String? categorieIds,
    dynamic charities,
    dynamic charityIds,
    dynamic workers,
    dynamic workerIds,
    UserMetadata? userMetadata,
  }) =>
      UserEntity(
        id: id ?? this.id,
        singpassId: singpassId ?? this.singpassId,
        corppassId: corppassId ?? this.corppassId,
        role: role ?? this.role,
        profileImage: profileImage ?? this.profileImage,
        profileImageUrl: profileImageUrl ?? this.profileImageUrl,
        thumbProfileImage: thumbProfileImage ?? this.thumbProfileImage,
        thumbProfileImageUrl: thumbProfileImageUrl ?? this.thumbProfileImageUrl,
        walletBalance: walletBalance ?? this.walletBalance,
        referalCode: referalCode ?? this.referalCode,
        loginWith: loginWith ?? this.loginWith,
        categories: categories ?? this.categories,
        categorieIds: categorieIds ?? this.categorieIds,
        charities: charities ?? this.charities,
        charityIds: charityIds ?? this.charityIds,
        workers: workers ?? this.workers,
        workerIds: workerIds ?? this.workerIds,
        userMetadata: userMetadata ?? this.userMetadata,
      );

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      UserEntity.fromMap(json);

  String toJson() => json.encode(toMap());

  factory UserEntity.fromMap(Map<String, dynamic> json) => UserEntity(
        id: json['id'] as String,
        singpassId: json['singpass_id'] as String?,
        corppassId:
            json['corppass_id'] == null ? null : json['corppass_id'] as String,
        role: json['role'] == null ? null : json['role'] as String,
        profileImage: json['profile_image'] as String?,
        profileImageUrl: json['profile_image_url'] as String?,
        thumbProfileImage: json['thumb_profile_image'] as String?,
        thumbProfileImageUrl: json['thumb_profile_image_url'] as String?,
        walletBalance: json['wallet_balance'] == null
            ? null
            : double.tryParse(json['wallet_balance'].toString()),
        referalCode: json['referal_code'] as String?,
        loginWith:
            json['login_with'] == null ? null : json['login_with'] as String,
        categories:
            json['categories'] == null ? null : json['categories'] as String,
        categorieIds: json['categorie_ids'] == null
            ? null
            : json['categorie_ids'] as String,
        charities: json['charities'],
        charityIds: json['charity_ids'],
        workers: json['workers'],
        workerIds: json['worker_ids'],
        userMetadata: json['user_metadata'] == null
            ? null
            : UserMetadata.fromMap(
                json['user_metadata'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'singpass_id': singpassId,
        'corppass_id': corppassId,
        'role': role,
        'profile_image': profileImage,
        'profile_image_url': profileImageUrl,
        'thumb_profile_image': thumbProfileImage,
        'thumb_profile_image_url': thumbProfileImageUrl,
        'wallet_balance': walletBalance,
        'referal_code': referalCode,
        'login_with': loginWith,
        'categories': categories,
        'categorie_ids': categorieIds,
        'charities': charities,
        'charity_ids': charityIds,
        'workers': workers,
        'worker_ids': workerIds,
        'user_metadata': userMetadata == null ? null : userMetadata!.toMap(),
      };

  String get address {
    if (userMetadata?.address != null) {
      var jsonAddress =
          jsonDecode(userMetadata?.address ?? '') as Map<String, dynamic>;
      var addressStr =
          '${jsonAddress['floor']['value']}, ${jsonAddress['building']['value']}, ${jsonAddress['street']['value']}, ${jsonAddress['block']['value']}, ${jsonAddress['country']['desc']}, ${jsonAddress['postal']['value']}.';
      var listOfAddItems = addressStr.split(', ');
      for (var i = 0; i < listOfAddItems.length; i++) {
        listOfAddItems[i] =
            toBeginningOfSentenceCase(listOfAddItems[i].toLowerCase()) ?? '';
      }
      return listOfAddItems.join(', ');
    } else {
      return '-';
    }
  }
}

class UserMetadata {
  UserMetadata({
    this.id,
    this.userId,
    this.nricFin,
    this.partialNricFin,
    this.principalName,
    this.sex,
    this.race,
    this.email,
    this.dob,
    this.nationality,
    this.mobileNumber,
    this.userData,
    this.address,
    this.typeOfHdb,
    this.typeOfHousing,
    this.maritialStatus,
    this.childBirths,
    this.entityAddresses,
    this.entityName,
    this.primaryActivity,
    this.secondaryActivity,
    this.aboutUs,
    this.displayAddress,
  });

  String? id;
  String? userId;
  String? nricFin;
  Map<String, dynamic>? userData;
  dynamic partialNricFin;
  String? principalName;
  dynamic sex;
  dynamic race;
  String? email;
  dynamic dob;
  dynamic nationality;
  String? mobileNumber;
  String? address;
  dynamic typeOfHdb;
  dynamic typeOfHousing;
  dynamic maritialStatus;
  dynamic childBirths;
  dynamic entityAddresses;
  String? entityName;
  String? primaryActivity;
  String? secondaryActivity;
  dynamic aboutUs;
  dynamic displayAddress;

  UserMetadata copyWith({
    String? id,
    String? userId,
    String? nricFin,
    Map<String, dynamic>? userData,
    dynamic partialNricFin,
    String? principalName,
    dynamic sex,
    dynamic race,
    String? email,
    dynamic dob,
    dynamic nationality,
    String? mobileNumber,
    String? address,
    dynamic typeOfHdb,
    dynamic typeOfHousing,
    dynamic maritialStatus,
    dynamic childBirths,
    dynamic entityAddresses,
    String? entityName,
    String? primaryActivity,
    String? secondaryActivity,
    dynamic aboutUs,
    dynamic displayAddress,
  }) =>
      UserMetadata(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        nricFin: nricFin ?? this.nricFin,
        userData: userData ?? this.userData,
        partialNricFin: partialNricFin ?? this.partialNricFin,
        principalName: principalName ?? this.principalName,
        sex: sex ?? this.sex,
        race: race ?? this.race,
        email: email ?? this.email,
        dob: dob ?? this.dob,
        nationality: nationality ?? this.nationality,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        address: address ?? this.address,
        typeOfHdb: typeOfHdb ?? this.typeOfHdb,
        typeOfHousing: typeOfHousing ?? this.typeOfHousing,
        maritialStatus: maritialStatus ?? this.maritialStatus,
        childBirths: childBirths ?? this.childBirths,
        entityAddresses: entityAddresses ?? this.entityAddresses,
        entityName: entityName ?? this.entityName,
        primaryActivity: primaryActivity ?? this.primaryActivity,
        secondaryActivity: secondaryActivity ?? this.secondaryActivity,
        aboutUs: aboutUs ?? this.aboutUs,
        displayAddress: displayAddress ?? this.displayAddress,
      );

  factory UserMetadata.fromJson(String str) =>
      UserMetadata.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory UserMetadata.fromMap(Map<String, dynamic> json) => UserMetadata(
        id: json['id'] == null ? null : json['id'] as String,
        userId: json['user_id'] == null ? null : json['user_id'] as String,
        nricFin: json['nric_fin'] as String?,
        partialNricFin: json['partial_nric_fin'],
        principalName: json['principal_name'] as String?,
        sex: json['sex'],
        race: json['race'],
        email: json['email'] as String?,
        dob: json['dob'],
        nationality: json['nationality'],
        mobileNumber: json['mobile_number'] as String?,
        address: json['address'] as String?,
        typeOfHdb: json['type_of_hdb'],
        typeOfHousing: json['type_of_housing'],
        maritialStatus: json['maritial_status'],
        childBirths: json['child_births'],
        entityAddresses: json['entity_addresses'],
        entityName:
            json['entity_name'] == null ? null : json['entity_name'] as String,
        primaryActivity: json['primary_activity'] == null
            ? null
            : json['primary_activity'] as String,
        secondaryActivity: json['secondary_activity'] == null
            ? null
            : json['secondary_activity'] as String,
        aboutUs: json['about_us'],
        displayAddress: json['display_address'],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'user_id': userId,
        'nric_fin': nricFin,
        'partial_nric_fin': partialNricFin,
        'principal_name': principalName,
        'user_metadata': userData,
        'sex': sex,
        'race': race,
        'email': email,
        'dob': dob,
        'nationality': nationality,
        'mobile_number': mobileNumber,
        'address': address,
        'type_of_hdb': typeOfHdb,
        'type_of_housing': typeOfHousing,
        'maritial_status': maritialStatus,
        'child_births': childBirths,
        'entity_addresses': entityAddresses,
        'entity_name': entityName,
        'primary_activity': primaryActivity,
        'secondary_activity': secondaryActivity,
        'about_us': aboutUs,
        'display_address': displayAddress,
      };

  String? get phone => (mobileNumber?.contains('+65') ?? false)
      ? mobileNumber
      : mobileNumber != null
          ? '+65-$mobileNumber'
          : null;
}
