import 'dart:developer';
import 'package:shoishob/dbHelper/constants.dart';
import 'package:shoishob/dbHelper/databaseModels/turf_booking_model.dart';
import '../utils/utils.dart';
import 'package:mongo_dart/mongo_dart.dart';

import 'databaseModels/database_model_tickets.dart';
import 'databaseModels/turf_info.dart';
import 'databaseModels/user_model.dart';

class MongoDatabase {
  static var db,
      userCollection,
      ticketCollection,
      turfDataCollection,
      turfBookingCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION_USERS);
    ticketCollection = db.collection(USER_COLLECTION_TICKETS);
    turfDataCollection = db.collection(USER_COLLECTION_TURFDATA);
    turfBookingCollection = db.collection(USER_COLLECTION_TURFBookingDATA);
  }

  static Future<void> insertUsersData(UserModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.toString().isEmpty) {
        print("user info cannot be inserted\n");
      } else {
        print("user info inserted\n");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> insertUser(String name, String email, String photoUrl,
      DateTime created, DateTime updated, String role) async {
    final data = UserModel(
        name: name,
        email: email,
        photo: photoUrl,
        createdAt: created,
        updatedAt: updated,
        role: role);
    await MongoDatabase.insertUsersData(data);
  }

  static Future<List<Map<String, dynamic>>> getUserData() async {
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static Future<Map<String, dynamic>> getUserDataEmail(String email) async {
    final arrData = await userCollection.findOne(where.eq('email', email));
    return arrData;
  }

  static Future<List<Map<String, dynamic>>> getTurfInfo() async {
    final arrData = await turfDataCollection.find().toList();
    return arrData;
  }

  static Future<void> insertTickets(DatabaseModelTicket data) async {
    try {
      print("OK");
      var result = await ticketCollection.insertOne(data.toJson());
      if (result.toString().isEmpty) {
        Utils.toastMessage("Ticket purchase failed");
      } else {
        Utils.toastMessage("Ticket Confirmed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> insertTicketsData(String name, String Date, String phone,
      String pickup, String destination, String ticketNo) async {
    final data = DatabaseModelTicket(
        name: name,
        date: Date,
        phone: phone,
        pickup: pickup,
        destination: destination,
        ticketNo: ticketNo);
    await MongoDatabase.insertTickets(data);
  }

  static Future<void> insertBookingInfo(TurfBookingModel data) async {
    try {
      var result = await turfBookingCollection.insertOne(data.toJson());
      if (result.toString().isEmpty) {
        Utils.toastMessage("Booking failed");
      } else {
        Utils.toastMessage("Booking Confirmed, Please make Payment");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> insertBookingData(
      String slots,
      int price,
      DateTime updated,
      DateTime created,
      String photoUrl,
      String email,
      String username,
      String phone,
      String bookingId,
      String address,
      String city,
      String ownerID,
      bool paid,
      String person,
      String selectedDate,
      String transactionId,
      String turfName) async {
    final data = TurfBookingModel(
        slot: slots,
        price: price,
        updatedAt: updated,
        createdAt: created,
        photo: photoUrl,
        email: email,
        name: username,
        phone: phone,
        address: address,
        bookingId: bookingId,
        city: city,
        ownerId: ownerID,
        paid: false,
        person: person,
        selectedDate: selectedDate,
        transactionId: transactionId,
        turf: turfName);
    await MongoDatabase.insertBookingInfo(data);
  }
}
