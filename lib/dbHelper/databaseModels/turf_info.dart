// To parse this JSON data, do
//
//     final turfInfo = turfInfoFromJson(jsonString);

import 'dart:convert';

TurfInfo turfInfoFromJson(String str) => TurfInfo.fromJson(json.decode(str));

String turfInfoToJson(TurfInfo data) => json.encode(data.toJson());

class TurfInfo {
  String turfName;
  String address;
  String about;
  String rules;
  String logo;
  String cover;
  String price;
  Map<int, String> person;
  Map<int, String> slots;

  TurfInfo({
    required this.turfName,
    required this.address,
    required this.about,
    required this.rules,
    required this.logo,
    required this.cover,
    required this.price,
    required this.person,
    required this.slots,
  });

  factory TurfInfo.fromJson(Map<String, dynamic> json) => TurfInfo(
    turfName: json["turf_name"],
    address: json["address"],
    about: json["about"],
    rules: json["rules"],
    logo: json["logo"],
    cover: json["cover"],
    price: json["price"],
    person: Map.from(json["person"]).map((k, v) => MapEntry<int, String>(k, v)),
    slots: Map.from(json["slots"]).map((k, v) => MapEntry<int, String>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "turf_name": turfName,
    "address": address,
    "about": about,
    "rules": rules,
    "logo": logo,
    "cover": cover,
    "price": price,
    "person": Map.from(person).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "slots": Map.from(slots).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
