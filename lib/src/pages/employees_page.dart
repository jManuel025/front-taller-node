import 'package:flutter/material.dart';
import 'package:front_taller_node/src/provider/employees_provider.dart';

class EmployeesPage extends StatefulWidget {
  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}

final employeeProvider = new EmployeesProvider();

class _EmployeesPageState extends State<EmployeesPage> {
  @override
  void initState() {
    super.initState();
    employeeProvider.getEmployees().then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Center(
          child: Text('Drawer'),
        ),
      ),
      appBar: AppBar(
        title: Text('Empleados'),
      ),
      body: Center(
        child: Text('Empleados'),
      ),
    );
  }
}
