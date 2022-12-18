import 'package:flutter/material.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
              createAccountText(),
              const SizedBox(
                height: 34,
              ),
              fieldController(),
              const SizedBox(
                height: 10,
              ),
              fieldController(),
              const SizedBox(
                height: 10,
              ),
              fieldController(),
              const SizedBox(
                height: 83,
              ),
              registerButton(),
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
              registerGoogle(),
              const SizedBox(
                height: 33,
              ),
              registerPage(),
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

Widget createAccountText() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 10,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Create an account',
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Start learning today!',
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: Color(AppColros.grey),
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}

Widget fieldController() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Full Name',
        style: TextStyle(
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

Widget registerButton() {
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
          color: Color(AppColros.blue)),
      child: const Center(
        child: Text(
          'Create Account',
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

Widget registerGoogle() {
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

Widget registerPage() {
  return Center(
    child: RichText(
      text: TextSpan(
        text: "Don’t have an account ? ",
        style: TextStyle(
          fontSize: 14.0,
          wordSpacing: 1,
          letterSpacing: 1.2,
          fontWeight: FontWeight.w600,
          color: Color(AppColros.grey),
        ),
        children: [
          TextSpan(
            text: "Log in",
            style: TextStyle(
              fontSize: 14.0,
              wordSpacing: 1,
              letterSpacing: 1.2,
              fontWeight: FontWeight.w600,
              color: Color(AppColros.blue),
            ),
          )
        ],
      ),
    ),
  );
}
