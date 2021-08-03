import 'dart:convert';

class AvailableVouchers {
  AvailableVouchers({
    this.id,
    this.name,
    this.description,
    this.terms,
    this.instructions,
    this.amount,
    this.availableCount,
    this.soldCount,
    this.iconName,
    this.iconUrl,
    this.thumbIconName,
    this.thumbIconUrl,
    this.startDate,
    this.endDate,
    this.validity,
    this.isPaid,
    this.isFeature,
    this.isActive,
    this.deleted,
  });

  String? id;
  String? name;
  String? description;
  String? terms;
  dynamic instructions;
  double? amount;
  double? availableCount;
  double? soldCount;
  String? iconName;
  String? iconUrl;
  dynamic thumbIconName;
  dynamic thumbIconUrl;
  DateTime? startDate;
  DateTime? endDate;
  String? validity;
  bool? isPaid;
  bool? isFeature;
  bool? isActive;
  bool? deleted;

  AvailableVouchers copyWith({
    String? id,
    String? name,
    String? description,
    String? terms,
    dynamic instructions,
    double? amount,
    double? availableCount,
    double? soldCount,
    String? iconName,
    String? iconUrl,
    dynamic thumbIconName,
    dynamic thumbIconUrl,
    DateTime? startDate,
    DateTime? endDate,
    String? validity,
    bool? isPaid,
    bool? isFeature,
    bool? isActive,
    bool? deleted,
  }) =>
      AvailableVouchers(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        terms: terms ?? this.terms,
        instructions: instructions ?? this.instructions,
        amount: amount ?? this.amount,
        availableCount: availableCount ?? this.availableCount,
        soldCount: soldCount ?? this.soldCount,
        iconName: iconName ?? this.iconName,
        iconUrl: iconUrl ?? this.iconUrl,
        thumbIconName: thumbIconName ?? this.thumbIconName,
        thumbIconUrl: thumbIconUrl ?? this.thumbIconUrl,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        validity: validity ?? this.validity,
        isPaid: isPaid ?? this.isPaid,
        isFeature: isFeature ?? this.isFeature,
        isActive: isActive ?? this.isActive,
        deleted: deleted ?? this.deleted,
      );

  factory AvailableVouchers.fromJson(Map<String, dynamic> json) =>
      AvailableVouchers.fromMap(json);

  String toJson() => json.encode(toMap());

  factory AvailableVouchers.fromMap(Map<String, dynamic> json) =>
      AvailableVouchers(
        id: json['id'] == null ? null : json['id'] as String,
        name: json['name'] == null ? null : json['name'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        terms: json['terms'] == null ? null : json['terms'] as String,
        instructions: json['instructions'],
        amount: json['amount'] == null ? null : json['amount'] as double,
        availableCount: json['available_count'] == null
            ? null
            : json['available_count'] as double,
        soldCount:
            json['sold_count'] == null ? null : json['sold_count'] as double,
        iconName:
            json['icon_name'] == null ? null : json['icon_name'] as String,
        iconUrl: json['icon_url'] == null ? null : json['icon_url'] as String,
        thumbIconName: json['thumb_icon_name'],
        thumbIconUrl: json['thumb_icon_url'],
        startDate: json['start_date'] == null
            ? null
            : DateTime.parse(json['start_date'] as String),
        endDate: json['end_date'] == null
            ? null
            : DateTime.parse(json['end_date'] as String),
        validity: json['validity'] == null ? null : json['validity'] as String,
        isPaid: json['is_paid'] == null ? null : json['is_paid'] as bool,
        isFeature:
            json['is_feature'] == null ? null : json['is_feature'] as bool,
        isActive: json['is_active'] == null ? null : json['is_active'] as bool,
        deleted: json['_deleted'] == null ? null : json['_deleted'] as bool,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'name': name,
        'description': description,
        'terms': terms,
        'instructions': instructions,
        'amount': amount,
        'available_count': availableCount,
        'sold_count': soldCount,
        'icon_name': iconName,
        'icon_url': iconUrl,
        'thumb_icon_name': thumbIconName,
        'thumb_icon_url': thumbIconUrl,
        'start_date': startDate,
        'end_date': endDate,
        'validity': validity,
        'is_paid': isPaid,
        'is_feature': isFeature,
        'is_active': isActive,
        '_deleted': deleted,
      };
}
