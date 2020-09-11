import 'package:flutter/material.dart';
import 'package:labinfoapp/ui/agendamento/agendamentos_screen.dart';
import 'package:labinfoapp/ui/agendamento/mainTabAgendamentos_screen.dart';
import 'package:labinfoapp/ui/login/login_screen.dart';
import 'package:labinfoapp/ui/register/register_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

