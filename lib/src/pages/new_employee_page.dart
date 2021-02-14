import 'package:flutter/material.dart';
import 'package:front_taller_node/src/widgets/custom_button_widget.dart';

class NewEmployee extends StatelessWidget {
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
              hintText: 'mail@mail.com',
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Lastname',
              hintText: 'mail@mail.com',
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Phone number',
              hintText: 'mail@mail.com',
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              hintText: 'mail@mail.com',
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
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
          onPressed: () {},
          text: 'Create',
          type: Type.primary,
        )
      ],
    );
  }
}
