
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shoishob/dbHelper/databaseModels/user_model.dart';
import 'package:shoishob/dbHelper/mongoDB.dart';
import 'package:shoishob/services/session_manager.dart';

class UserInfoClass {
  String? email, name, photoUrl="https://cdn.imgbin.com/7/15/1/imgbin-computer-icons-user-profile-avatar-french-people-xM6vuY3iWZ6yhbNYaVeX2nvVL.jpg", id;
  int? point;
  UserInfoClass() {
    _getUserData();
  }

  Future<void> _getUserData() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    email = user!.email;
    var snap = await MongoDatabase.getUserDataEmail(email!);
    if (snap.isNotEmpty) {
      var userData = UserModel.fromJson(snap);
      name = userData.name;
      photoUrl = userData.photo;
      point = userData.point;
      SessionController().userEmail = email;
      SessionController().userName = name;
      SessionController().userPhotoUrl = photoUrl;
      SessionController().point = point;
    }
  }
}
