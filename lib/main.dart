import 'package:flutter/material.dart';
import 'package:notes_app_creativa/home_screen.dart';

void main(List<String> args) {
  runApp(
    _MyApp()
  );
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}