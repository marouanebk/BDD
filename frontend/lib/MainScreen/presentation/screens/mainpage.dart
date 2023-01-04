import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/MainScreen/presentation/controller/bloc/course_bloc.dart';
import 'package:frontend/MainScreen/presentation/screens/coursedetail.dart';
import 'package:frontend/MainScreen/presentation/screens/search/search_screen.dart';
import 'package:frontend/authentication/presentation/screens/register_page.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/services/service_locator.dart';
import 'package:frontend/cores/utils/enums.dart';
import 'package:frontend/cores/widgets/text_input_field.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final controller = PageController(initialPage: 0);
  TextEditingController _search = TextEditingController();
  int pageindex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<CourseBloc>()..add(GetSuggestedCoursesEvent()),
        child: Builder(builder: (context) {
          return SafeArea(
              child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    searchBar(context),
                    const SizedBox(
                      height: 9,
                    ),
                    coursesEnrolled(),
                    const SizedBox(
                      height: 27,
                    ),
                    discoverCourses(context),
                    const SizedBox(
                      height: 22,
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
                                switch (state.getSuggestedCoursesState) {
                                  case RequestState.loading:
                                    return const Center(
                                      child: LoadingWidget(),
                                    );

                                  case RequestState.loaded:
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: suggestedCourses0(
                                          context, state.getSuggestedCourses),
                                    );
                                  case RequestState.error:
                                    return Text(
                                        state.getSuggestedCoursesmessage);
                                }
                              },
                            ),
                            BlocBuilder<CourseBloc, CourseState>(
                              builder: (context, state) {
                                switch (state.getSuggestedCoursesState) {
                                  case RequestState.loading:
                                    return const Center(
                                      child: LoadingWidget(),
                                    );

                                  case RequestState.loaded:
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: suggestedCourses0(
                                          context, state.getSuggestedCourses),
                                    );
                                  case RequestState.error:
                                    return Text(
                                        state.getSuggestedCoursesmessage);
                                }
                              },
                            ),
                            BlocBuilder<CourseBloc, CourseState>(
                              builder: (context, state) {
                                switch (state.getSuggestedCoursesState) {
                                  case RequestState.loading:
                                    return const Center(
                                      child: LoadingWidget(),
                                    );

                                  case RequestState.loaded:
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: suggestedCourses0(
                                          context, state.getSuggestedCourses),
                                    );
                                  case RequestState.error:
                                    return Text(
                                        state.getSuggestedCoursesmessage);
                                }
                              },
                            ),
                            BlocBuilder<CourseBloc, CourseState>(
                              builder: (context, state) {
                                switch (state.getSuggestedCoursesState) {
                                  case RequestState.loading:
                                    return const Center(
                                      child: LoadingWidget(),
                                    );

                                  case RequestState.loaded:
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: suggestedCourses0(
                                          context, state.getSuggestedCourses),
                                    );
                                  case RequestState.error:
                                    return Text(
                                        state.getSuggestedCoursesmessage);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
        }),
      ),
    );
  }

  Widget suggestedCourses0(context, items) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const SizedBox(
        height: 14,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return suggestedCourseCard0(context, items[index]);
      },
    );
  }

  Widget suggestedCourseCard0(context, item) {
    return GestureDetector(
      onTap: () => Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (_) => CourseDetailScreen(id: item.courseid),
        ),
      ),
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
                    text: " ${item.year} ",
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

  Widget discoverCourses(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Discover the Latest Courses',
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w600,
            color: Color(AppColors.writting),
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 11,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              courseType(0, "Made For You"),
              const SizedBox(
                width: 10,
              ),
              courseType(1, "Made For You"),
              const SizedBox(
                width: 10,
              ),
              courseType(2, "Made For You"),
              const SizedBox(
                width: 10,
              ),
              courseType(3, "Made For You"),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ],
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

  Widget searchBar(context) {
    return GestureDetector(
      onTap: () => Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(
          builder: (_) => const SearchScreen(),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                color: const Color(0xFFBEC5D1),
              ),
              color: Colors.white,
            ),
            child: const Center(
              child: Text(
                'search here',
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            )),
      ),
    );
  }
}

Widget coursesEnrolled() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Courses you’ve already started',
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w600,
                color: Color(AppColors.writting),
                fontSize: 18,
              ),
            ),
            InkWell(
              child: Text(
                'See All',
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w500,
                  color: Color(AppColors.writting),
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 12,
      ),
      SizedBox(
        height: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) {
            return courseCard();
          },
        ),
      ),
    ],
  );
}

Widget courseCard() {
  return Container(
    height: 102,
    width: 230,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      border: Border.all(
        color: const Color(0xFF0085FF),
      ),
      color: Color(AppColors.course),
    ),
    child: Padding(
      padding: const EdgeInsets.only(top: 20, left: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Analyse',
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w600,
                  color: Color(AppColors.writting),
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                '2nd year - IT',
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w600,
                  color: Color(AppColors.greyWritting),
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Started 20 days ago',
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w600,
                  color: Color(AppColors.blue),
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Center(
            child: CircularPercentIndicator(
              radius: 35.0,
              lineWidth: 10.0,
              animation: true,
              percent: 0.85,
              center: const Text(
                "85.0%",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Color(AppColors.blue),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget suggestedCourses(context, items) {
  return ListView.separated(
    scrollDirection: Axis.vertical,
    separatorBuilder: (context, index) => const SizedBox(
      height: 14,
    ),
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: items.length,
    itemBuilder: (context, index) {
      return suggestedCourseCard(context, items[index]);
    },
  );
}

Widget suggestedCourseCard(context, index) {
  return GestureDetector(
    onTap: () => Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => CourseDetailScreen(id: index.courseid),
      ),
    ),
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
              shape: BoxShape.circle,
            ),
            child: Image.network(
              "https://picsum.photos/250?image=9",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          RichText(
            text: TextSpan(
              text: index.title,
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w600,
                color: Color(AppColors.writting),
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: " ${index.year}",
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
