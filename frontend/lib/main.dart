import 'package:flutter/material.dart';
import 'package:frontend/authentication/presentation/screens/loginPage.dart';
import 'package:frontend/authentication/presentation/screens/registerPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
  
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
    );
  }
}
