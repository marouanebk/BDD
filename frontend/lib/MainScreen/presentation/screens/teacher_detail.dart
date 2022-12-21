import 'package:flutter/material.dart';
import 'package:frontend/MainScreen/presentation/screens/coursedetail.dart';
import 'package:frontend/MainScreen/presentation/screens/mainpage.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';

class TeacherDetailScreen extends StatelessWidget {
  const TeacherDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                teacherHeader(context),
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
                const Padding(
                  padding: EdgeInsets.only(right: 10, left: 20),
                  child: Text(
                    "Lorem ipsum dolor sit amet consectetur. Faucibus scelerisque condimentum sem pharetra neque egestas. Tellus mauris orci amet urna fermentum quisque habitasse. Mauris a bibendum nascetur elit sagittis aenean quam posuere. Quis dolor auctor adipiscing etiam etiam.",
                    style: TextStyle(
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFB4B4B4),
                      fontSize: 18,
                    ),
                  ),
                ),
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
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: suggestedCourses(context),
                ),
              ],
            ),
          ],
        ),
      ),
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

Widget teacherHeader(context) {
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
            const Text(
              "Djamila merid",
              style: TextStyle(
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
