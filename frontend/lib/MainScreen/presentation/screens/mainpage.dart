import 'package:flutter/material.dart';
import 'package:frontend/MainScreen/presentation/screens/coursedetail.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
              children: [
                searchBar(),
                const SizedBox(
                  height: 9,
                ),
                coursesEnrolled(),
                const SizedBox(
                  height: 27,
                ),
                discoverCourses(),
                const SizedBox(
                  height: 22,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: suggestedCourses(context),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}

Widget searchBar() {
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
        color: Colors.orange,
      ),
    ),
  );
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

Widget discoverCourses() {
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
            courseType(1, "Made For You"),
            const SizedBox(
              width: 10,
            ),
            courseType(0, "Made For You"),
            const SizedBox(
              width: 10,
            ),
            courseType(0, "Made For You"),
            const SizedBox(
              width: 10,
            ),
            courseType(0, "Made For You"),
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
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(17)),
      border: Border.all(
        color: Color(AppColors.blue),
      ),
      color: number == 0 ? const Color(0xFFFFFFFF) : Color(AppColors.blue),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontFamily: AppFonts.mainFont,
        fontWeight: FontWeight.w500,
        color: number == 0 ? Color(AppColors.blue) : const Color(0xFFFFFFFF),
        fontSize: 12,
      ),
    ),
  );
}

Widget suggestedCourses(context) {
  return ListView.separated(
    scrollDirection: Axis.vertical,
    separatorBuilder: (context, index) => const SizedBox(
      height: 14,
    ),
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: 5,
    itemBuilder: (context, index) {
      return suggestedCourseCard(context);
    },
  );
}

Widget suggestedCourseCard(context) {
  return GestureDetector(
    onTap: () => Navigator.of(context, rootNavigator: true).push(
      MaterialPageRoute(
        builder: (_) => const CourseDetail(),
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
              text: "BDD Course ",
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w600,
                color: Color(AppColors.writting),
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: "2nd year - IT",
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



