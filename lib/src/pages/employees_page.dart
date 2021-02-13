import 'package:flutter/material.dart';
import 'package:front_taller_node/src/models/employee_model.dart';
import 'package:front_taller_node/src/provider/employees_provider.dart';

class EmployeesPage extends StatefulWidget {
  @override
  _EmployeesPageState createState() => _EmployeesPageState();
}

final employeesProvider = new EmployeesProvider();

class _EmployeesPageState extends State<EmployeesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _userInfo(),
      appBar: AppBar(
        brightness: Brightness.dark,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
        title: Text('Empleados', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: _employeesList(),
    );
  }

  Widget _userInfo() {
    return Drawer(
      child: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 100.0,
                backgroundColor: Theme.of(context).accentColor,
                child: Text(
                  'JM',
                  style: TextStyle(
                    fontSize: 50.0,
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Manuel Castillo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(height: 100.0),
              ListTile(
                minLeadingWidth: 0,
                leading: Icon(Icons.mail_outline),
                title: Text('Correo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Text('manuel@mail.com'),
              ),
              ListTile(
                minLeadingWidth: 0,
                leading: Icon(Icons.phone),
                title: Text('Teléfono',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
                subtitle: Text('985-161-1665'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _employeesList() {
    return FutureBuilder(
      future: employeesProvider.getEmployees(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          final employees = snapshot.data;
          return ListView.builder(
            itemCount: employees.length,
            itemBuilder: (_, i) {
              return _employeeCard(employees, i);
            },
          );
        } else {
          return Text('no hay');
        }
      },
    );
  }

  Widget _employeeCard(List<Employee> employees, int i) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _employeeAvatar(employees, i),
          _employeeData(employees, i),
        ],
      ),
    );
  }

  Widget _employeeAvatar(List<Employee> employees, int i) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).accentColor,
          radius: 50.0,
          child: Text(
            '${employees[i].nombre.substring(0, 2).toUpperCase()}',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }

  Widget _employeeData(List<Employee> employees, int i) {
    return Expanded(
      flex: 5,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${employees[i].nombre} ${employees[i].apellidos}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Text('Teléfono: ${employees[i].telefono}'),
            Text('Correo: ${employees[i].correo}'),
            Text('Dirección: ${employees[i].direccion}'),
          ],
        ),
      ),
    );
  }
}
