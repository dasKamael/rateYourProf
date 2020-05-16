import 'package:flutter/material.dart';
import 'pages/login.dart';
void main() {
  runApp(MaterialApp(
    initialRoute: "/login",
    routes: {
      "/login": (context) => Login(),
    }
  ));
}
