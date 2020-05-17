import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/chooseProf.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/login",
      routes: {
        "/login": (context) => Login(),
        "/chooseProf": (context) => ChooseProf(),
      },
    ),
  );
}
