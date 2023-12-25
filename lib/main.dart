import 'package:flutter/material.dart';
import 'package:login/login_screen.dart';

final theme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
        seedColor: Color.fromARGB(255, 9, 119, 162)));
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: theme, home: const LoginScreen());
  }
}
