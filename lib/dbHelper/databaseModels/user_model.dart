// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String name;
  String email;
  String role;
  String photo;
  DateTime createdAt;
  DateTime updatedAt;
  int point;

  UserModel({
    required this.name,
    required this.email,
    required this.role,
    required this.photo,
    required this.createdAt,
    required this.updatedAt,
    required this.point,
  });

  factory UserModel.fromJson(Map<dynamic, dynamic> json) => UserModel(
    name: json["name"],
    email: json["email"],
    role: json["role"],
    photo: json["photo"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    point: json['point']
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "role": role,
    "photo": photo,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    'point' : point,
  };
}
