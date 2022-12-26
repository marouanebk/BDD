import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/presentation/screens/base_screen.dart';
import 'package:frontend/MainScreen/presentation/screens/teacher/teacher_base_screen.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_bloc.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_event.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_state.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';

class ChoicePage extends StatefulWidget {
  const ChoicePage({super.key});

  @override
  State<ChoicePage> createState() => _ChoicePageState();
}

class _ChoicePageState extends State<ChoicePage> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserBloc>(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Image.asset(
                        "assets/signin_bg.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 306,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.white),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(right: 20, left: 20, top: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'You are a',
                            style: TextStyle(
                              fontFamily: AppFonts.mainFont,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                index = 1;
                              });
                            },
                            child: Container(
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    color: (index == 1)
                                        ? Color(AppColors.blue)
                                        : const Color(0xFFBEC5D1),
                                    width: (index == 1) ? 2 : 1),
                              ),
                              child: Center(
                                child: Text(
                                  'Student',
                                  style: TextStyle(
                                    fontFamily: AppFonts.mainFont,
                                    fontWeight: (index == 1)
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                    color: (index == 1)
                                        ? Color(AppColors.blue)
                                        : Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 9,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                index = 2;
                              });
                            },
                            child: Container(
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    color: (index == 2)
                                        ? Color(AppColors.blue)
                                        : const Color(0xFFBEC5D1),
                                    width: (index == 2) ? 2 : 1),
                              ),
                              child: Center(
                                child: Text(
                                  'Teacher',
                                  style: TextStyle(
                                    fontFamily: AppFonts.mainFont,
                                    fontWeight: (index == 2)
                                        ? FontWeight.w600
                                        : FontWeight.w500,
                                    color: (index == 2)
                                        ? Color(AppColors.blue)
                                        : Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<UserBloc>(context)
                                  .add(ChooseTypeEvent(number: index));
                            },
                            child: Container(
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  color: Color(AppColors.blue)),
                              child: const Center(
                                child: Text(
                                  'Start Browsing',
                                  style: TextStyle(
                                    fontFamily: AppFonts.mainFont,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          BlocListener<UserBloc, UserBlocState>(
                            listener: (context, state) {
                              if (state is ErrorUserBlocState) {
                              } else if (state is StudentLoginState) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BaseScreen()),
                                    (Route<dynamic> route) => false);
                              } else if (state is TeacherLoginState) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const TeacherScreen()),
                                    (Route<dynamic> route) => false);
                              }
                            },
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 273),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    height: 90,
                    width: 90,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Image.asset(
                      "assets/images/logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
