// To parse this JSON data, do
//
//     final databaseModelTicket = databaseModelTicketFromJson(jsonString);

import 'dart:convert';

DatabaseModelTicket databaseModelTicketFromJson(String str) =>
    DatabaseModelTicket.fromJson(json.decode(str));

String databaseModelTicketToJson(DatabaseModelTicket data) =>
    json.encode(data.toJson());

class DatabaseModelTicket {
  String ticketNo;
  String name;
  String phone;
  String pickup;
  String destination;
  String date;
  String email;

  DatabaseModelTicket({
    required this.ticketNo,
    required this.name,
    required this.phone,
    required this.pickup,
    required this.destination,
    required this.date,
    required this.email,
  });

  factory DatabaseModelTicket.fromJson(Map<String, dynamic> json) =>
      DatabaseModelTicket(
          ticketNo: json["ticketNo"],
          name: json["name"],
          phone: json["phone"],
          pickup: json["pickup"],
          destination: json["destination"],
          date: json["date"],
          email: json["email"]);

  Map<String, dynamic> toJson() => {
        "ticketNo": ticketNo,
        "name": name,
        "phone": phone,
        "pickup": pickup,
        "destination": destination,
        "date": date,
        "email": email,
      };
}
