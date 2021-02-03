import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:front_taller_node/src/utils/preferences.dart';
import 'package:front_taller_node/src/models/employee_model.dart';

final _prefs = Preferences();
final _employees = EmployeeModel();

class EmployeesProvider {
  final String url = 'http://192.168.100.26:8000';
  Future<List<EmployeeModel>> getEmployees() async {
    final endpoint = '$url/empleados';
    final res = await http.get(endpoint, headers: {
      'Accept': 'application/json',
      'Authorization': 'bearer ${_prefs.token}'
    });
    final listEmployees =
        _employees.fromJsonList(json.decode(res.body)['message']);
    return listEmployees;
  }
}
