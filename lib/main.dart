import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart'; // Pastikan ini ada
import 'pages/register_page.dart';
import 'pages/detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(), // Halaman awal
      routes: {
        '/home': (context) => HomePage(), // Rute ke HomePage
        '/register': (context) => RegisterPage(),
        '/detail': (context) => DetailPage(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
