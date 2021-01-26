import 'package:flutter/material.dart';
import 'package:front_taller_node/src/utils/preferences.dart';
import 'package:front_taller_node/src/utils/validations.dart';
import 'package:front_taller_node/src/models/user_model.dart';
import 'package:front_taller_node/src/provider/login_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

final loginFormKey = GlobalKey<FormState>();
final emailController = new TextEditingController();
final passwordController = new TextEditingController();
final loginProvider = new LoginProvider();
final _prefs = Preferences();
UserModel user = new UserModel();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
      ),
      body: _formContainer(size),
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
            child: _loginForm(context)),
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
          SizedBox(
            height: 10.0,
          ),
          _submitButton(context),
        ],
      ),
    );
  }

  // email input
  Widget _emailInput() {
    return TextFormField(
      // style: TextStyle(fontSize: 18.0),
      validator: (email) => isEmail(email),
      controller: emailController,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
          hintText: 'mail@mail.com'),
    );
  }

  // password input
  Widget _passwordInput() {
    return TextField(
      // style: TextStyle(fontSize: 18.0),
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
          hintText: '123456'),
    );
  }

  Widget _submitButton(BuildContext context) {
    return TextButton(
      child: Text(
        'LOGIN',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
            Size(MediaQuery.of(context).size.width * 0.5, 48.0)),
        backgroundColor:
            MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
      ),
      onPressed: () => _submit(context),
    );
  }

  // enviar formulario
  void _submit(BuildContext context) async {
    if (loginFormKey.currentState.validate()) {
      loginFormKey.currentState.save();
      user.email = emailController.text;
      user.password = passwordController.text;
      final resp = await loginProvider.login(user);
      _prefs.token = resp.message;
      if (_prefs.token.toString().isNotEmpty) {
        Navigator.pushReplacementNamed(context, 'employees');
      } else {
        // TODO - poner retroalimentacion de errores
        print('Correo no valido');
      }
    }
  }
}
