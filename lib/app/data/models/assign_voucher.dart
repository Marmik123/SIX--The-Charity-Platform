import 'dart:convert';

class AssignVoucher {
  AssignVoucher({
    this.voucherId,
    this.name,
    this.amount,
    this.iconUrl,
    this.total,
  });

  String? voucherId;
  String? name;
  int? amount;
  String? iconUrl;
  String? total;

  AssignVoucher copyWith({
    String? voucherId,
    String? name,
    int? amount,
    String? iconUrl,
    String? total,
  }) =>
      AssignVoucher(
        voucherId: voucherId ?? this.voucherId,
        name: name ?? this.name,
        amount: amount ?? this.amount,
        iconUrl: iconUrl ?? this.iconUrl,
        total: total ?? this.total,
      );

  factory AssignVoucher.fromJson(Map<String, dynamic> json) =>
      AssignVoucher.fromMap(json);

  String toJson() => json.encode(toMap());

  factory AssignVoucher.fromMap(Map<String, dynamic> json) => AssignVoucher(
        voucherId:
            json['voucher_id'] == null ? null : json['voucher_id'] as String,
        name: json['name'] == null ? null : json['name'] as String,
        amount: json['amount'] == null ? null : json['amount'] as int,
        iconUrl: json['icon_url'] == null ? null : json['icon_url'] as String,
        total: json['total'] == null ? null : json['total'] as String,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'voucher_id': voucherId,
        'name': name,
        'amount': amount,
        'icon_url': iconUrl,
        'total': total,
      };
}
