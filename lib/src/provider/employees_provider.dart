import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:front_taller_node/src/utils/preferences.dart';
import 'package:front_taller_node/src/models/employee_model.dart';

final _prefs = Preferences();

class EmployeeProvider {
  String _url = 'http://192.168.100.26:8000';

  Future<List<Employee>> getEmployees() async {
    final endpoint = '$_url/empleados';
    final res = await http.get(endpoint, headers: {
      'Accept': 'application/json',
      'Authorization': 'bearer ${_prefs.token}'
    });
    final data = Employees.fromJsonList(json.decode(res.body)['message']);
    return data.employees;
  }

  Future<dynamic> addEmployee(Employee employee) async {
    final endpoint = '$_url/empleados/';
    final res = await http.post(endpoint,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'bearer ${_prefs.token}'
        },
        body: employee.toJson());
    final data = json.decode(res.body)['message'];
    return data;
  }
}
