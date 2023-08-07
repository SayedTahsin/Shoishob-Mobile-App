
//Single tone class for storing and managing the session of login
class SessionController{
  static final SessionController _session = SessionController._internal();
  String? userId;
  String? userName;
  String? userEmail;
  String? userPhotoUrl;

  factory SessionController(){
    return _session;
  }
  SessionController._internal(){
  }
}