import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  static SharedPreferences? preference;
  static String token ="token";

  Future<void> init() async {
    preference = await SharedPreferences.getInstance();
  }
 static dynamic setToken(String _token){
   return preference!.setString(token, _token);
  }
static dynamic  getToken(){
    return preference!.getString(token);
  }
}
