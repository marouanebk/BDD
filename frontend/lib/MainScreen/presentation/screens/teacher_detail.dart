import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/presentation/controller/bloc/course_bloc.dart';
import 'package:frontend/MainScreen/presentation/screens/coursedetail.dart';
import 'package:frontend/MainScreen/presentation/screens/mainpage.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_bloc.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_event.dart';
import 'package:frontend/authentication/presentation/controller/authentication_bloc/authentication_state.dart';
import 'package:frontend/authentication/presentation/screens/register_page.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:frontend/cores/utils/enums.dart';

class TeacherDetailScreen extends StatefulWidget {
  final id;
  const TeacherDetailScreen({super.key, required this.id});

  @override
  State<TeacherDetailScreen> createState() => _TeacherDetailScreenState();
}

class _TeacherDetailScreenState extends State<TeacherDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              sl<CourseBloc>()..add(GetCoursesByTeacherEvent(widget.id)),
        ),
        BlocProvider(
          create: (context) =>
              sl<UserBloc>()..add(GetUserDetailsEvent(id: widget.id)),
        ),
      ],
      child: Builder(builder: (context) {
        return Scaffold(
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
              children: [
                ClipPath(
                  clipper: CustomShape(),
                  child: Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    color: Color(AppColors.blue),
                  ),
                ),
                BlocBuilder<UserBloc, UserBlocState>(
                  builder: (context, state) {
                    if (state is UserDetailState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          teacherHeader(context, state.usermodel),
                          const SizedBox(
                            height: 40,
                          ),
                          Center(child: messageButtonTeacher()),
                          const SizedBox(
                            height: 38,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Biography",
                              style: TextStyle(
                                fontFamily: AppFonts.mainFont,
                                fontWeight: FontWeight.w600,
                                color: Color(AppColors.greyWritting),
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, left: 20),
                              child: (state.usermodel.biography == null)
                                  ? const Text(
                                      "user has no biography yet ",
                                      style: TextStyle(
                                        fontFamily: AppFonts.mainFont,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFB4B4B4),
                                        fontSize: 18,
                                      ),
                                    )
                                  : Text(
                                      state.usermodel.biography!,
                                      style: const TextStyle(
                                        fontFamily: AppFonts.mainFont,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFB4B4B4),
                                        fontSize: 18,
                                      ),
                                    )),
                          const SizedBox(
                            height: 18,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              reviewCard("09", "Courses"),
                              const SizedBox(
                                width: 20,
                              ),
                              reviewCard("4.6/5", "AvgRate"),
                              const SizedBox(
                                width: 20,
                              ),
                              reviewCard("+9 yrs", "TeachingExp"),
                              const SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          BlocBuilder<CourseBloc, CourseState>(
                            builder: (context, state) {
                              if (state.getCoursesByTeacherState ==
                                  RequestState.loaded) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: suggestedCourses(
                                      context, state.getCoursesByTeacher),
                                );
                              } else {
                                return const LoadingWidget();
                              }
                            },
                          ),
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 100);
    path.quadraticBezierTo(size.width / 2, 220, size.width, 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget teacherHeader(context, user) {
  return Padding(
    padding: const EdgeInsets.only(top: 50.0, left: 20, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 54,
          height: 38,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(36)),
            color: Colors.white,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 105,
              width: 105,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.orange),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              user.fullname,
              style: const TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 24,
              ),
              textAlign: TextAlign.start,
            ),
          ],
        ),
        const SizedBox(
          width: 54,
          height: 38,
        ),
      ],
    ),
  );
}

Widget messageButtonTeacher() {
  return Container(
    height: 28,
    width: 104,
    // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(17)),
        border: Border.all(
          color: Color(AppColors.blue),
        ),
        color: const Color(0xFFFFFFFF)),
    child: Center(
      child: Text(
        "Message",
        style: TextStyle(
          fontFamily: AppFonts.mainFont,
          fontWeight: FontWeight.w500,
          color: Color(AppColors.blue),
          fontSize: 14,
        ),
      ),
    ),
  );
}
