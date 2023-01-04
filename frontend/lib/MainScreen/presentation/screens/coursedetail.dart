import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/domaine/entities/course_content.dart';
import 'package:frontend/MainScreen/presentation/controller/bloc/course_bloc.dart';
import 'package:frontend/MainScreen/presentation/screens/pdf_preview.dart';
import 'package:frontend/MainScreen/presentation/screens/teacher_detail.dart';
import 'package:frontend/authentication/presentation/screens/register_page.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:frontend/cores/utils/enums.dart';

class CourseDetailScreen extends StatelessWidget {
  final String id;
  const CourseDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CourseBloc>()..add(GetCourseDetailEvent(id)),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<CourseBloc, CourseState>(
            builder: (context, state) {
              switch (state.getCourseDetailState) {
                case RequestState.loading:
                  return const LoadingWidget();
                case RequestState.loaded:
                  return Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            courseHeader(
                              context,
                              state.getCourseDetail!.title,
                              state.getCourseDetail!.year,
                              state.getCourseDetail!.teacherName,
                              state.getCourseDetail!.teacherId,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            reviews(),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Course intro:",
                                    style: TextStyle(
                                      fontFamily: AppFonts.mainFont,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF5A5A5A),
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      state.getCourseDetail!.description,
                                      style: const TextStyle(
                                        fontFamily: AppFonts.mainFont,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFB4B4B4),
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 23,
                                  ),
                                  const Text(
                                    "Course Info:",
                                    style: TextStyle(
                                      fontFamily: AppFonts.mainFont,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF5A5A5A),
                                      fontSize: 18,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  courseContent(
                                      context, state.getCourseDetail!),
                                  const SizedBox(
                                    height: 80,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      startCourseButton(),
                    ],
                  );
                case RequestState.error:
                  return Text(state.getCourseDetailmessage);
              }
            },
          ),
        );
      }),
    );
  }
}

Widget courseHeader(context, name, year, teacherName, teacherid) {
  return Container(
    height: 202,
    width: double.infinity,
    color: Color(AppColors.blue),
    padding: const EdgeInsets.only(left: 24, right: 20, top: 50),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(36)),
                  color: Colors.white),
              child: Icon(
                Icons.favorite,
                color: Color(AppColors.blue),
                size: 18,
              ),
            ),
          ],
        ),
        Text(
          name,
          style: const TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 32,
          ),
        ),
        Text(
          year,
          style: const TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        InkWell(
          onTap: () => Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (_) => TeacherDetailScreen(
                id: teacherid,
              ),
            ),
          ),
          child: Container(
            width: 230,
            height: 30,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 23,
                  height: 23,
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  teacherName,
                  style: const TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget reviews() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      reviewCard("+4K", "Students"),
      const SizedBox(
        width: 20,
      ),
      reviewCard("4.2/5", "Course rate"),
    ],
  );
}

Widget courseContent(context, items) {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const SizedBox(
        height: 14,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.courseContent.length,
      itemBuilder: (context, index) {
        return courseContentCard(context, items.courseContent[index]);
      },
    ),
  );
}

Widget courseContentCard(context, item) {
  return GestureDetector(
    onTap: () => Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => const PdfPreviewPage(),
      ),
    ),
    child: Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(
          color: Color(AppColors.blue),
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(left: 11, top: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            color: const Color(0xFFE8EFF5),
            child: Image.asset(
              "assets/images/pdf.png",
              // fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 37,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "item",
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w600,
                  color: Color(AppColors.writting),
                  fontSize: 16,
                ),
              ),
              Text(
                "16 pages",
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w600,
                  color: Color(AppColors.grey),
                  fontSize: 16,
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget startCourseButton() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0, left: 20, right: 20),
    child: InkWell(
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
            'Start Course',
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
  );
}

Widget reviewCard(text1, text2) {
  return Container(
    width: 105,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      border: Border.all(
        color: const Color(0xFFD9D9D9),
      ),
      color: Colors.white,
    ),
    child: Column(
      children: [
        Text(
          text1,
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w600,
            color: Color(AppColors.blue),
            fontSize: 24,
          ),
        ),
        Text(
          text2,
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w600,
            color: Color(AppColors.greyWritting),
            fontSize: 14,
          ),
        ),
      ],
    ),
  );
}
