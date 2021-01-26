import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instance = new Preferences._internal();
  factory Preferences() {
    return _instance;
  }
  Preferences._internal();
  SharedPreferences _prefs;
  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }
}
