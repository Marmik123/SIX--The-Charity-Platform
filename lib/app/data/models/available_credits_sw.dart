import 'dart:convert';

class AvailableCredits {
  AvailableCredits({
     this.id,
     this.userId,
     this.charityProgramId,
     this.categoryId,
     this.totalBalance,
     this.isActive,
     this.deleted,
     this.createdAt,
     this.updatedAt,
     this.category,
  });

  String? id;
  String? userId;
  dynamic charityProgramId;
  String? categoryId;
  int? totalBalance;
  bool? isActive;
  bool? deleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  Category? category;

  AvailableCredits copyWith({
    String? id,
    String? userId,
    dynamic charityProgramId,
    String? categoryId,
    int? totalBalance,
    bool? isActive,
    bool? deleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    Category? category,
  }) =>
      AvailableCredits(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        charityProgramId: charityProgramId ?? this.charityProgramId,
        categoryId: categoryId ?? this.categoryId,
        totalBalance: totalBalance ?? this.totalBalance,
        isActive: isActive ?? this.isActive,
        deleted: deleted ?? this.deleted,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        category: category ?? this.category,
      );

  factory AvailableCredits.fromJson(Map<String,dynamic> json) => AvailableCredits.fromMap(json);

  String toJson() => json.encode(toMap());

  factory AvailableCredits.fromMap(Map<String, dynamic> json) => AvailableCredits(
    id: json['id'] as String,
    userId: json['user_id'] as String,
    charityProgramId: json['charity_program_id'],
    categoryId: json['category_id'] as String,
    totalBalance: json['total_balance'] as int,
    isActive: json['is_active'] as bool,
    deleted: json['_deleted'] as bool,
    createdAt: json['createdAt'] == null ? null : DateTime.parse(json['createdAt'] as String),
    updatedAt: json['updatedAt'] == null ? null : DateTime.parse(json['updatedAt'] as String),
    category: json['category'] == null ? null : Category.fromMap(json['category'] as Map<String,dynamic>),
  );

  Map<String, dynamic> toMap() => <String,dynamic>{
    'id': id,
    'user_id': userId,
    'charity_program_id': charityProgramId,
    'category_id': categoryId,
    'total_balance': totalBalance,
    'is_active': isActive,
    '_deleted': deleted,
    'createdAt': createdAt ,
    'updatedAt': updatedAt ,
    'category': category ,
  };
}

class Category {
  Category({
     this.id,
     this.name,
     this.background,
     this.forground,
     this.accent,
     this.iconName,
     this.iconUrl,
  });

  String? id;
  String? name;
  String? background;
  String? forground;
  String? accent;
  String? iconName;
  String? iconUrl;

  Category copyWith({
    String? id,
    String? name,
    String? background,
    String? forground,
    String? accent,
    String? iconName,
    String? iconUrl,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        background: background ?? this.background,
        forground: forground ?? this.forground,
        accent: accent ?? this.accent,
        iconName: iconName ?? this.iconName,
        iconUrl: iconUrl ?? this.iconUrl,
      );

  factory Category.fromJson(Map<String,dynamic> json) => Category.fromMap(json);

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
    id: json['id'] as String,
    name: json['name'] as String,
    background: json['background'] as String,
    forground: json['forground'] as String,
    accent: json['accent'] as String,
    iconName: json['icon_name'] as String,
    iconUrl: json['icon_url'] as String,
  );

  Map<String, dynamic> toMap() => <String,dynamic>{
    'id': id,
    'name': name,
    'background': background,
    'forground': forground,
    'accent': accent,
    'icon_name': iconName,
    'icon_url': iconUrl,
  };
}
