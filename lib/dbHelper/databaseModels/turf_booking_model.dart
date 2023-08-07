// To parse this JSON data, do
//
//     final turfBookingModel = turfBookingModelFromJson(jsonString);

import 'dart:convert';

TurfBookingModel turfBookingModelFromJson(String str) =>
    TurfBookingModel.fromJson(json.decode(str));

String turfBookingModelToJson(TurfBookingModel data) =>
    json.encode(data.toJson());

class TurfBookingModel {
  String address;
  String email;
  String name;
  String phone;
  String selectedDate;
  String slot;
  String turf;
  int price;
  String photo;
  String ownerId;
  bool paid;
  DateTime createdAt;
  DateTime updatedAt;
  String city;
  String person;
  String transactionId;
  String bookingId;

  TurfBookingModel({
    required this.address,
    required this.email,
    required this.name,
    required this.phone,
    required this.selectedDate,
    required this.slot,
    required this.turf,
    required this.price,
    required this.photo,
    required this.ownerId,
    required this.paid,
    required this.createdAt,
    required this.updatedAt,
    required this.city,
    required this.person,
    required this.transactionId,
    required this.bookingId,
  });

  factory TurfBookingModel.fromJson(Map<String, dynamic> json) =>
      TurfBookingModel(
        address: json["address"],
        email: json["email"],
        name: json["name"],
        phone: json["phone"],
        selectedDate: json["selectedDate"],
        slot: json["slot"],
        turf: json["turf"],
        price: json["price"],
        photo: json["photo"],
        ownerId: json["ownerId"],
        paid: json["paid"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        city: json["city"],
        person: json["person"],
        transactionId: json["transactionId"],
        bookingId: json["bookingId"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "email": email,
        "name": name,
        "phone": phone,
        "selectedDate": selectedDate,
        "slot": slot,
        "turf": turf,
        "price": price,
        "photo": photo,
        "ownerId": ownerId,
        "paid": paid,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "city": city,
        "person": person,
        "transactionId": transactionId,
        "bookingId": bookingId,
      };
}
