import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:flutter_todo/pages/main_screen.dart';
import 'package:flutter_todo/pages/settings.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/todo': (context) => Home(),
        '/settings': (context) => Settings(),
      },
    );
  }
}

