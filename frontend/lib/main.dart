import 'package:flutter/material.dart';
import 'package:frontend/MainScreen/presentation/screens/base_screen.dart';
import 'package:frontend/authentication/presentation/screens/login_page.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isLoggedIn;

void main() async {
  await ServiceLocator().init();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isLoggedIn = prefs.getInt("is logged in");

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
      home: (isLoggedIn == 1) ? const BaseScreen() : const LoginPage(),
    );
  }
}
