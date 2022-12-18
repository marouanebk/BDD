import 'package:flutter/material.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'dart:math' as math;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Center(
                child: Image.asset('assets/images/logo.png'),
              ),
              const SizedBox(
                height: 63,
              ),
              welcomeText(),
              const SizedBox(
                height: 33,
              ),
              fieldController("Full Name "),
              const SizedBox(
                height: 10,
              ),
              fieldController("Password"),
              const SizedBox(
                height: 18,
              ),
              forgotPassword(),
              const SizedBox(
                height: 126,
              ),
              loginButton(),
              const SizedBox(
                height: 41,
              ),
              const Center(
                child: Text(
                  'Or With',
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              loginGoogle(),
              const SizedBox(
                height: 33,
              ),
              loginPage(),
              const SizedBox(
                height: 33,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget welcomeText() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 10,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: "Hi, Welcome Back! ",
            style: const TextStyle(
              fontFamily: AppFonts.mainFont,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontSize: 25,
            ),
            children: [
              WidgetSpan(
                  child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: const Icon(
                  Icons.waving_hand_sharp,
                  color: Color(0xFFFFCC99),
                ),
              )),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Hello again, you’ve been missed!',
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: Color(AppColors.grey),
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

Widget fieldController(label) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontFamily: AppFonts.mainFont,
          fontWeight: FontWeight.w600,
          color: Color(0xFF00004D),
          fontSize: 14,
        ),
      ),
      const SizedBox(
        height: 9,
      ),
      Container(
        width: double.infinity,
        height: 41,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(color: const Color(0xFFBEC5D1)),
        ),
      )
    ],
  );
}

Widget forgotPassword() {
  return Align(
    alignment: Alignment.centerRight,
    child: Text(
      "Forgot Passowrd ? ",
      style: TextStyle(
        fontFamily: AppFonts.mainFont,
        fontWeight: FontWeight.w600,
        color: Color(AppColors.blue),
        fontSize: 14,
      ),
    ),
  );
}

Widget loginButton() {
  return InkWell(
    onTap: () => {},
    child: Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: const Color(0xFFBEC5D1),
          ),
          color: Color(AppColors.blue)),
      child: const Center(
        child: Text(
          'Login',
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 17,
          ),
        ),
      ),
    ),
  );
}

Widget loginGoogle() {
  return InkWell(
    onTap: () => {},
    child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: const Color(0xFFBEC5D1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/googleLogo.png',
              width: 25,
              height: 25,
            ),
            const Text(
              '    Google',
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        )),
  );
}

Widget loginPage() {
  return Center(
    child: RichText(
      text: TextSpan(
        text: "Don’t have an account ? ",
        style: TextStyle(
          fontSize: 14.0,
          wordSpacing: 1,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w600,
          color: Color(AppColors.grey),
        ),
        children: [
          TextSpan(
            text: "Log in",
            style: TextStyle(
              fontSize: 14.0,
              wordSpacing: 1,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
              color: Color(AppColors.blue),
            ),
          )
        ],
      ),
    ),
  );
}
