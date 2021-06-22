//{
//   "greeting": "Welcome to quicktype!",
//   "name": "Deep Shah",
//   "age": 23,
//   "salary": 20.09,
//   "addresses": [
//       {
//           "city": "Surat",
//           "State": "Gujarat",
//           "pincode": 395009,
//           "lat": 123.456,
//           "long": 456.789,
//           "places": [
//               "Pal",
//               "Adajan",
//               "Pal RTO"
//               ]
//       },
//       {
//           "city": "Surat",
//           "State": "Gujarat",
//           "pincode": 395009,
//           "lat": 123.456,
//           "long": 456.789,
//           "places": [
//               "Pal",
//               "Adajan",
//               "Pal RTO"
//               ]
//       }
//   ],
//   "primary_address":{
//       "city": "Surat",
//       "State": "Gujarat",
//       "pincode": 395009,
//       "lat": 123.456,
//       "long": 456.789,
//       "places": [
//           "Pal",
//           "Adajan",
//           "Pal RTO"
//           ]
//   }
// }
// To parse this JSON data, do
//
//     final welcome = welcomeFromMap(jsonString);

import 'dart:convert';

class Welcome {
  Welcome({
    this.greeting,
    this.name,
    this.age,
    this.salary,
    this.addresses,
    this.primaryAddress,
  });

  String? greeting;
  String? name;
  int? age;
  double? salary;
  List<Address>? addresses;
  Address? primaryAddress;

  Welcome copyWith({
    String? greeting,
    String? name,
    int? age,
    double? salary,
    List<Address>? addresses,
    Address? primaryAddress,
  }) =>
      Welcome(
        greeting: greeting ?? this.greeting,
        name: name ?? this.name,
        age: age ?? this.age,
        salary: salary ?? this.salary,
        addresses: addresses ?? this.addresses,
        primaryAddress: primaryAddress ?? this.primaryAddress,
      );

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome.fromMap(json);

  Map<String, dynamic> toJson() => toMap();

  factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
        greeting: json['greeting'] == null ? null : json['greeting'] as String,
        name: json['name'] == null ? null : json['name'] as String,
        age: json['age'] == null ? null : json['age'] as int,
        salary: json['salary'] == null ? null : json['salary'] as double,
        addresses: json['addresses'] == null
            ? null
            : List<Address>.from(
                (json['addresses'] as List<Map<String, dynamic>>)
                    .map<Address>((x) => Address.fromMap(x))),
        primaryAddress: json['primary_address'] == null
            ? null
            : Address.fromMap(json['primary_address'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'greeting': greeting,
        'name': name,
        'age': age,
        'salary': salary,
        'addresses': addresses == null
            ? null
            : List<Map<String, dynamic>>.from(
                addresses!.map<Map<String, dynamic>>((x) => x.toMap())),
        'primary_address':
            primaryAddress == null ? null : primaryAddress!.toMap(),
      };
}

class Address {
  Address({
    this.city,
    this.state,
    this.pincode,
    this.lat,
    this.long,
    this.places,
  });

  String? city;
  String? state;
  int? pincode;
  double? lat;
  double? long;
  List<String>? places;

  Address copyWith({
    String? city,
    String? state,
    int? pincode,
    double? lat,
    double? long,
    List<String>? places,
  }) =>
      Address(
        city: city ?? this.city,
        state: state ?? this.state,
        pincode: pincode ?? this.pincode,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        places: places ?? this.places,
      );

  factory Address.fromJson(String str) =>
      Address.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory Address.fromMap(Map<String, dynamic> json) => Address(
        city: json['city'] as String,
        state: json['State'] as String,
        pincode: json['pincode'] as int,
        lat: json['lat'] == null ? null : json['lat'] as double,
        long: json['long'] == null ? null : json['long'] as double,
        places: json['places'] == null
            ? null
            : List<String>.from(
                (json['places'] as List<String>).map<String>((x) => x)),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'city': city,
        'State': state,
        'pincode': pincode,
        'lat': lat,
        'long': long,
        'places': places == null
            ? null
            : List<String>.from(places!.map<String>((x) => x)),
      };
}
