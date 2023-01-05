import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/presentation/controller/bloc/course_bloc.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:frontend/cores/utils/enums.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = PageController(initialPage: 0);
  int pageindex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CourseBloc>(),
      child: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 26,
                  ),
                  searchBar(context),
                  const SizedBox(
                    height: 9,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      courseType(0, "Courses"),
                      const SizedBox(
                        width: 10,
                      ),
                      courseType(1, "Teachers"),
                      const SizedBox(
                        width: 10,
                      ),
                      courseType(2, "Groups"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Flexible(
                    child: SizedBox(
                      height: 600,
                      child: PageView(
                        controller: controller,
                        onPageChanged: (index) {
                          log("page ${index + 1} ");
                          pageindex = index;
                          setState(() {
                            index;
                          });
                        },
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          BlocBuilder<CourseBloc, CourseState>(
                            builder: (context, state) {
                              switch (state.searchCoursesState) {
                                case RequestState.loading:
                                  // return const CircularProgressIndicator(
                                  //   color: Colors.red,
                                  // );
                                  return Container();
                                case RequestState.loaded:
                                  return coursesSearch(
                                      context, state.searchCourses);

                                case RequestState.error:
                                  return Container();
                              }
                            },
                          ),
                          BlocBuilder<CourseBloc, CourseState>(
                            builder: (context, state) {
                              switch (state.searchUsersState) {
                                case RequestState.loading:
                                  // return const CircularProgressIndicator(
                                  //   color: Colors.red,
                                  // );
                                  return Container();
                                case RequestState.loaded:
                                  return teachersSearch(
                                      context, state.searchUsers);

                                case RequestState.error:
                                  return Container();
                              }
                            },
                          ),
                          // teachersSearch(),
                          Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget searchBar(context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: const Color(0xFFBEC5D1),
          ),
          color: const Color(0xFFF4F6F9),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (text) {
                BlocProvider.of<CourseBloc>(context)
                    .add(SearchCoursesEvent(text));
                BlocProvider.of<CourseBloc>(context)
                    .add(SearchUsersEvent(text));
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget courseType(number, text) {
    return GestureDetector(
      onTap: () {
        controller.animateToPage(number,
            duration: const Duration(seconds: 1), curve: Curves.ease);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(17)),
          border: Border.all(
            color: Color(AppColors.blue),
          ),
          color: number == pageindex
              ? Color(AppColors.blue)
              : const Color(0xFFFFFFFF),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: number == pageindex
                ? const Color(0xFFFFFFFF)
                : Color(AppColors.blue),
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  Widget coursesSearch(context, items) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const SizedBox(
        height: 14,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return courseCard(items[index]);
      },
    );
  }

  Widget teachersSearch(context, items) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const SizedBox(
        height: 14,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return teacherCard(items[index]);
      },
    );
  }

  Widget courseCard(item) {
    return GestureDetector(
      // onTap: () => Navigator.of(context, rootNavigator: true).push(
      //   MaterialPageRoute(
      //     builder: (_) => CourseDetailScreen(id: item.courseid),
      //   ),
      // ),
      child: Container(
        width: double.infinity,
        height: 87,
        padding: const EdgeInsets.only(top: 15, left: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: const Color(0xFFD9D9D9),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            RichText(
              text: TextSpan(
                text: item.title,
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w600,
                  color: Color(AppColors.writting),
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: item.year,
                    style: TextStyle(
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.w500,
                      color: Color(AppColors.greyWritting),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget teacherCard(item) {
    return GestureDetector(
      // onTap: () => Navigator.of(context, rootNavigator: true).push(
      //   MaterialPageRoute(
      //     builder: (_) => CourseDetailScreen(id: item.courseid),
      //   ),
      // ),
      child: Container(
        width: double.infinity,
        height: 87,
        padding: const EdgeInsets.only(top: 15, left: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: const Color(0xFFD9D9D9),
          ),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.fullname,
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w600,
                    color: Color(AppColors.writting),
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "PhD in Quantum Computing",
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w500,
                    color: Color(AppColors.grey),
                    fontSize: 14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
