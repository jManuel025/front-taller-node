import 'package:flutter/material.dart';
import 'package:front_taller_node/src/utils/preferences.dart';
import 'package:front_taller_node/src/utils/validations.dart';
import 'package:front_taller_node/src/models/user_model.dart';
import 'package:front_taller_node/src/provider/login_provider.dart';
import 'package:front_taller_node/src/widgets/custom_button_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final loginFormKey = GlobalKey<FormState>();
final loginProvider = new LoginProvider();
final _prefs = Preferences();
User user = new User();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(child: _formContainer(size)),
    );
  }

  // contenedor formulario
  Widget _formContainer(Size size) {
    return Center(
      child: Card(
        elevation: 5.0,
        shadowColor: Color(0x804F3EC8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: EdgeInsets.all(25.0),
          height: size.height * 0.40,
          width: size.width * 0.95,
          child: _loginForm(context),
        ),
      ),
    );
  }

  // formulario
  Widget _loginForm(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _emailInput(),
          _passwordInput(),
          SizedBox(height: 10.0),
          CustomButton(
            text: 'Login',
            type: Type.primary,
            onPressed: () => _submit(context),
          )
        ],
      ),
    );
  }

  // email input
  Widget _emailInput() {
    return TextFormField(
      validator: (email) => isValid(email, Value.email),
      onSaved: (email) => {user.email = email},
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
        hintText: 'mail@mail.com',
      ),
    );
  }

  // password input
  Widget _passwordInput() {
    return TextFormField(
      obscureText: true,
      onSaved: (password) => {user.password = password},
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
        hintText: '123456',
      ),
    );
  }

  // enviar formulario
  void _submit(BuildContext context) async {
    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      final resp = await loginProvider.login(user);
      _prefs.token = resp['message'];
      if (_prefs.token.toString().isNotEmpty) {
        Navigator.pushReplacementNamed(context, 'employees');
      } else {
        // TODO - poner retroalimentacion de errores
        print('Correo no valido');
      }
    }
  }
}
