import 'package:flutter/material.dart';
import 'package:profrate/pages/profRating.dart';
import 'pages/login.dart';
import 'pages/chooseProf.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: "/login",
      routes: {
        "/login": (context) => Login(),
        "/chooseProf": (context) => ChooseProf(),
        "/profRating": (context) => ProfRating(),
      },
    ),
  );
}
