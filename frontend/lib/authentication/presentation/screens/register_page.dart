import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/authentication/domaine/entities/user_entitiy.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_bloc.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_event.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_state.dart';
import 'package:frontend/authentication/presentation/screens/choise.dart';
import 'package:frontend/authentication/presentation/screens/login_page.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:frontend/cores/widgets/text_input_field.dart';
import 'package:uuid/uuid.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _fullname = TextEditingController();
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
                    fieldController("Fullname", context, _fullname, false),
                    const SizedBox(
                      height: 10,
                    ),
                    fieldController("Email", context, _email, false),
                    const SizedBox(
                      height: 10,
                    ),
                    fieldController("Password", context, _password, true),
                    BlocListener<UserBloc, UserBlocState>(
                      listener: (context, state) {
                        if (state is ErrorUserBlocState) {
                          setState(() {
                            error = state.message;
                          });
                        } else if (state is MessageUserBlocState) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const ChoicePage()),
                              (Route<dynamic> route) => false);
                        }
                      },
                      child: errorBox(),
                    ),
                    const Spacer(),
                    registerButton(context),
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
                    registerPage(context),
                    const SizedBox(
                      height: 33,
                    ),
                  ],
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
              hintText: "Please Enter Your $label",
              textEditingController: controller,
              textInputType: TextInputType.text,
              isPass: type,
            ),
          ),
        )
      ],
    );
  }

  Widget registerButton(context) {
    return InkWell(
      onTap: () {
        createAccount(context);
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
                    'Create Account',
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
          )),
    );
  }

  void createAccount(context) {
    var uuid = Uuid().v4();

    final userCred = User(
      userid: uuid,
      fullname: _fullname.text,
      email: _email.text,
      password: _password.text,
    );
    BlocProvider.of<UserBloc>(context).add(CreateUserEvent(user: userCred));
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

  Widget registerPage(context) {
    return Center(
      child: GestureDetector(
        onTap: () => Navigator.of(context, rootNavigator: true).push(
          MaterialPageRoute(
            builder: (_) => const LoginPage(),
          ),
        ),
        child: RichText(
          text: TextSpan(
            text: "Already have an account ? ",
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
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        // color: Color(AppColors.blue),
        color: Colors.red,
      ),
    );
  }
}
