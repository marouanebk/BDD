import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/presentation/screens/base_screen.dart';
import 'package:frontend/MainScreen/presentation/screens/teacher/teacher_screen.dart';
import 'package:frontend/authentication/domaine/entities/user_entitiy.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_bloc.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_event.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_state.dart';
import 'package:frontend/authentication/presentation/screens/register_page.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:frontend/cores/widgets/text_input_field.dart';
import 'dart:math' as math;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final GlobalKey<FormState> globalformkey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  String error = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserBloc>(),
      child: Builder(builder: (context) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 10, top: 37),
                child: Form(
                  key: globalformkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Spacer(),
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
                      fieldController("Email", context, _email, false),
                      const SizedBox(
                        height: 10,
                      ),
                      fieldController("Password", context, _password, true),
                      const SizedBox(
                        height: 18,
                      ),
                      forgotPassword(),
                      BlocListener<UserBloc, UserBlocState>(
                        listener: (context, state) {
                          if (state is ErrorUserBlocState) {
                            setState(() {
                              error = state.message;
                            });
                            // } else if (state is MessageUserBlocState) {
                            //   Navigator.of(context).pushAndRemoveUntil(
                            //       MaterialPageRoute(
                            //           builder: (context) => const BaseScreen()),
                            //       (Route<dynamic> route) => false);
                            // }
                          } else if (state is StudentLoginState) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => const BaseScreen()),
                                (Route<dynamic> route) => false);
                          } else if (state is TeacherLoginState) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TeacherScreen()),
                                (Route<dynamic> route) => false);
                          }
                        },
                        child: errorBox(),
                      ),
                      const Spacer(),
                      loginButton(context), //
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
                      loginGoogle(context),
                      const SizedBox(
                        height: 33,
                      ),
                      loginPage(context),
                      const SizedBox(
                        height: 33,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget errorBox() {
    return SizedBox(
      height: 30,
      child: Center(
        child: Text(
          error,
          style: const TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
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

  Widget fieldController(
      label, BuildContext context, TextEditingController controller, type) {
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
          child: Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: TextFieldInput(
              hintText: label,
              textEditingController: controller,
              textInputType: TextInputType.text,
              isPass: type,
            ),
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

  Widget loginButton(context) {
    return InkWell(
      onTap: () => {
        loginAccount(context),
      },
      child: Container(
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(
              color: const Color(0xFFBEC5D1),
            ),
            color: Color(AppColors.blue)),
        child: Center(
          child: BlocBuilder<UserBloc, UserBlocState>(
            builder: (context, state) {
              if (state is LodingUserBlocState) {
                return const LoadingWidget();
              } else {
                return const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontSize: 17,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  void loginAccount(context) {
    final userCred = User(
      email: _email.text,
      password: _password.text,
    );
    BlocProvider.of<UserBloc>(context).add(
      LoginuserEvent(
        user: userCred,
      ),
    );
  }

  Widget loginGoogle(context) {
    return InkWell(
      onTap: () => Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (_) => const BaseScreen(),
        ),
      ),
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

  Widget loginPage(context) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (_) => const RegisterPage(),
          ),
        ),
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
                text: "Register now",
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
      ),
    );
  }
}
