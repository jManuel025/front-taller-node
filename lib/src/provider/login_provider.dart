import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:front_taller_node/src/models/user_model.dart';

class LoginProvider {
  String _url = 'http://192.168.100.26:8000/user';

  Future<Map> login(User user) async {
    final endpoint = '$_url/login';
    final res = await http.post(endpoint, body: user.toJson());
    return json.decode(res.body);
  }
}
