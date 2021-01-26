import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:front_taller_node/src/models/employee_model.dart';

class EmployeesProvider {
  final String url = 'http://192.168.0.22:8000';
  Future<dynamic> getEmployees() async {
    final endpoint = '$url/empleados';
    final res = await http.get(endpoint);
    return json.decode(res.body);
  }
}
