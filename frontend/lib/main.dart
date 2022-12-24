import 'package:flutter/material.dart';
import 'package:frontend/authentication/presentation/screens/login_page.dart';
import 'package:frontend/cores/services/service_locator.dart';
// import 'package:frontend/MainScreen/presentation/screens/base_screen.dart';
// import 'package:frontend/authentication/presentation/screens/login_page.dart';

void main() async {
  await ServiceLocator().init();
  WidgetsFlutterBinding.ensureInitialized();

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
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
