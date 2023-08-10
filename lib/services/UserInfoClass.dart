import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoishob/dbHelper/databaseModels/user_model.dart';
import 'package:shoishob/dbHelper/mongoDB.dart';
import 'package:shoishob/services/session_manager.dart';

class UserInfoClass {
  String? email, name, photoUrl, id;
  int? point;
  UserInfoClass() {
    _getUserData();
  }

  Future<void> _getUserData() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    User? _user = _auth.currentUser;

    if (_user != null) {
      email = _user.email;
      var snap = await MongoDatabase.getUserDataEmail(email!);
      var userData = UserModel.fromJson(snap as Map<String, dynamic>);
      name = userData.name;
      photoUrl = userData.photo;
      point = userData.point;
      // print(name);
      // print(photoUrl);
      // print(email);
      SessionController().userEmail = email;
      SessionController().userName = name;
      SessionController().userPhotoUrl = photoUrl;
      SessionController().point = point;
    }
  }
}
