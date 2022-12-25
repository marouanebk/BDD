import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/presentation/screens/coursedetail.dart';

import 'package:frontend/MainScreen/presentation/screens/teacher_detail.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_bloc.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_event.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_state.dart';
import 'package:frontend/authentication/presentation/screens/login_page.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:flutter/services.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  String fullname = "";

  void getuserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    fullname = prefs.getString("fullname")!;
  }

  @override
  void initState() {
    getuserName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserBloc>(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Color(AppColors.blue),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: CustomShape(),
                    child: Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width,
                      color: Color(AppColors.blue),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          height: 128,
                          width: 128,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.orange),
                        ),
                        Text(
                          fullname,
                          style: TextStyle(
                            fontFamily: AppFonts.mainFont,
                            fontWeight: FontWeight.w600,
                            color: Color(AppColors.writting),
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(
                          height: 26,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            reviewCard("09", "Courses started"),
                            const SizedBox(
                              width: 20,
                            ),
                            reviewCard("30%", "Completed"),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        profileScreenList(context),
                        BlocListener<UserBloc, UserBlocState>(
                            listener: (context, state) {
                              if (state is ErrorUserBlocState) {
                              } else if (state is SignOuState) {
                                // Navigator.of(context).pushReplacement(
                                //   MaterialPageRoute(
                                //     builder: (context) => const LoginPage(),
                                //   ),
                                // );
                                Navigator.of(context, rootNavigator: true)
                                    .pushReplacement(MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              }
                            },
                            child: Container()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget profileScreenList(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Column(
        children: [
          profileScreenCard(
            Icons.person,
            "Profile",
            "Edit the details of your profile ",
          ),
          const SizedBox(
            height: 10,
          ),
          profileScreenCard(
            Icons.menu_book_sharp,
            "My Courses",
            "See all saved and studied courses",
          ),
          const SizedBox(
            height: 10,
          ),
          profileScreenCardNoDesc(
            Icons.security,
            "Privacy Policies",
          ),
          const SizedBox(
            height: 10,
          ),
          profileScreenCardNoDesc(
            Icons.question_answer,
            "FAQs",
          ),
          const SizedBox(
            height: 10,
          ),
          logOutWidget(
            context,
            Icons.logout,
            "Log out",
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget profileScreenCard(icon, text1, text2) {
    return Container(
      height: 64,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          color: const Color(0xFFD9D9D9),
        ),
      ),
      padding: const EdgeInsets.only(right: 10, left: 23),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Icon(
              icon,
              color: Color(AppColors.blue),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w600,
                    color: Color(AppColors.writting),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                Text(
                  text2,
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w600,
                    color: Color(AppColors.grey),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ))
        ],
      ),
    );
  }

  Widget profileScreenCardNoDesc(icon, text1) {
    return Container(
      height: 64,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
          color: const Color(0xFFD9D9D9),
        ),
      ),
      padding: const EdgeInsets.only(right: 10, left: 23),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Icon(
              icon,
              color: Color(AppColors.blue),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Center(
            child: Text(
              text1,
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w600,
                color: Color(AppColors.writting),
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
              child: Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ))
        ],
      ),
    );
  }

  Widget logOutWidget(context, icon, text1) {
    return GestureDetector(
      onTap: () {
        logout(context);
      },
      child: Container(
        height: 64,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(
            color: const Color(0xFFD9D9D9),
          ),
        ),
        padding: const EdgeInsets.only(right: 10, left: 23),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                icon,
                color: Color(AppColors.blue),
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Center(
              child: Text(
                text1,
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w600,
                  color: Color(AppColors.writting),
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
                child: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios),
              ),
            ))
          ],
        ),
      ),
    );
  }

  void logout(context) {
    log("in log out in profile screen");
    BlocProvider.of<UserBloc>(context).add(
      const LogOutUserEvent(),
    );
  }
}
