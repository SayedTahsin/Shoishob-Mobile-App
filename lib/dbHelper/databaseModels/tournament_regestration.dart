// To parse this JSON data, do
//
//     final tournamentRegistrationModel = tournamentRegistrationModelFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

TournamentRegistrationModel tournamentRegistrationModelFromJson(String str) => TournamentRegistrationModel.fromJson(json.decode(str));

String tournamentRegistrationModelToJson(TournamentRegistrationModel data) => json.encode(data.toJson());

class TournamentRegistrationModel {
  String address;
  String captainName;
  String city;
  String email;
  int person;
  String player2Email;
  String player3Email;
  String player4Email;
  String player5Email;
  String player6Email;
  String player7Email;
  String playerPhoneOne;
  int price;
  String teamName;
  String transactionId;
  bool paid;
  ObjectId tournamentId;
  DateTime createdAt;
  DateTime updatedAt;

  TournamentRegistrationModel({
    required this.address,
    required  this.captainName,
    required this.city,
    required this.email,
    required this.person,
    required this.player2Email,
    required this.player3Email,
    required this.player4Email,
    required this.player5Email,
    required this.player6Email,
    required this.player7Email,
    required this.playerPhoneOne,
    required this.price,
    required this.teamName,
    required this.transactionId,
    required this.paid,
    required this.tournamentId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TournamentRegistrationModel.fromJson(Map<String, dynamic> json) => TournamentRegistrationModel(
    address: json["address"],
    captainName: json["captain_name"],
    city: json["city"],
    email: json["email"],
    person: json["person"],
    player2Email: json["player_2_email"],
    player3Email: json["player_3_email"],
    player4Email: json["player_4_email"],
    player5Email: json["player_5_email"],
    player6Email: json["player_6_email"],
    player7Email: json["player_7_email"],
    playerPhoneOne: json["player_Phone_one"],
    price: json["price"],
    teamName: json["team_name"],
    transactionId: json["transactionId"],
    paid: json["paid"],
    tournamentId: json["tournamentId"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "address": address,
    "captain_name": captainName,
    "city": city,
    "email": email,
    "person": person,
    "player_2_email": player2Email,
    "player_3_email": player3Email,
    "player_4_email": player4Email,
    "player_5_email": player5Email,
    "player_6_email": player6Email,
    "player_7_email": player7Email,
    "player_Phone_one": playerPhoneOne,
    "price": price,
    "team_name": teamName,
    "transactionId": transactionId,
    "paid": paid,
    "tournamentId": tournamentId,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}
