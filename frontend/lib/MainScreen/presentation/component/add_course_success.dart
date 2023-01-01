import 'package:flutter/material.dart';
import 'package:frontend/MainScreen/presentation/screens/teacher/teacher_base_screen.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';

class CourseAddSuccess extends StatelessWidget {
  const CourseAddSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(
              child: Icon(
                Icons.verified_rounded,
                color: Color(
                  AppColors.blue,
                ),
                size: 150,
              ),
            ),
            Center(
              child: Text(
                "Course Published",
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w600,
                  color: Color(
                    AppColors.blue,
                  ),
                  fontSize: 16,
                ),
              ),
            ),
            const Spacer(),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const TeacherScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                        color: Color(AppColors.blue)),
                    child: const Center(
                      child: Text(
                        "Go to my Courses",
                        style: TextStyle(
                          fontFamily: AppFonts.mainFont,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
