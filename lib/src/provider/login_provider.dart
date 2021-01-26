import 'package:http/http.dart' as http;
import 'package:front_taller_node/src/models/user_model.dart';
import 'package:front_taller_node/src/models/login_model.dart';

class LoginProvider {
  final String _url = 'http://192.168.0.22:8000/user';

  Future<LoginModel> login(UserModel user) async {
    final endpoint = '$_url/login';
    final resp = await http.post(
      endpoint,
      body: user.toJson(),
    );
    return loginModelFromJson(resp.body);
  }
}
