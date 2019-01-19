import 'package:shared_preferences/shared_preferences.dart';

class Sp {
  static put(String key, String value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  static getS(String key, Function callback) async {
    SharedPreferences.getInstance().then((prefs) {
      callback(prefs.getString(key));
    });
  }

  static deleteS(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static putToken(String value) {
    put("token", value);
  }

  static getToken(Function callback) async {
    SharedPreferences.getInstance().then((prefs) {
      callback(prefs.getString('token'));
    });
  }

  static deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
  }
} 