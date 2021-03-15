import 'package:flutter/material.dart';
import 'package:front_taller_node/src/models/employee_model.dart';
import 'package:front_taller_node/src/provider/employees_provider.dart';
import 'package:front_taller_node/src/utils/validations.dart';
import 'package:front_taller_node/src/widgets/custom_button_widget.dart';

class NewEmployee extends StatefulWidget {
  @override
  _NewEmployeeState createState() => _NewEmployeeState();
}

final addFormKey = GlobalKey<FormState>();
final employeeProvider = EmployeeProvider();
Employee employee = new Employee();

class _NewEmployeeState extends State<NewEmployee> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text('New employee')),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: _newEmployeeForm(),
            ),
          ),
          _formButtons(size)
        ],
      ),
    );
  }

  Widget _newEmployeeForm() {
    return Form(
      key: addFormKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFormField(
            validator: (name) => isValid(name, Value.name),
            onSaved: (name) => {employee.nombre = name},
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
              hintText: 'mail@mail.com',
            ),
          ),
          SizedBox(height: 32.0),
          TextFormField(
            validator: (lastname) => isValid(lastname, Value.name),
            onSaved: (lastname) => {employee.apellidos = lastname},
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Lastname',
              hintText: 'mail@mail.com',
            ),
          ),
          SizedBox(height: 32.0),
          TextFormField(
            validator: (phoneNumber) => isValid(phoneNumber, Value.phoneNumber),
            onSaved: (phoneNumber) => {employee.telefono = phoneNumber},
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone number',
              hintText: 'mail@mail.com',
            ),
          ),
          SizedBox(height: 32.0),
          TextFormField(
            validator: (email) => isValid(email, Value.email),
            onSaved: (email) => {employee.correo = email},
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              hintText: 'mail@mail.com',
            ),
          ),
          SizedBox(height: 32.0),
          TextFormField(
            validator: (address) => isValid(address, Value.address),
            onSaved: (address) => {employee.direccion = address},
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Address',
              hintText: 'mail@mail.com',
            ),
          ),
        ],
      ),
    );
  }

  Widget _formButtons(Size size) {
    return ButtonBar(
      alignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomButton(
          onPressed: () {},
          text: 'Cancel',
          type: Type.secondary,
        ),
        CustomButton(
          onPressed: () => _submit(),
          text: 'Create',
          type: Type.primary,
        )
      ],
    );
  }

  void _submit() async {
    if (addFormKey.currentState.validate()) {
      addFormKey.currentState.save();
      final res = await employeeProvider.addEmployee(employee);
      print(res);
    }
  }
}
