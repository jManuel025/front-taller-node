import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:front_taller_node/src/pages/login_page.dart';
import 'package:front_taller_node/src/pages/employees_page.dart';
import 'package:front_taller_node/src/pages/new_employee_page.dart';
import 'package:front_taller_node/src/utils/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new Preferences();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: null,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Taller node',
      theme: ThemeData(
        fontFamily: 'SpaceGrotesk',
        accentColor: Color(0xFFFFBF3B),
        primaryColor: Color(0xFF4F3EC8),
      ),
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'employees': (BuildContext context) => EmployeesPage(),
        'employee/create': (BuildContext context) => NewEmployee(),
      },
      initialRoute: 'login',
    );
  }
}
