import 'package:flutter/material.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            courseHeader(context),
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
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
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
                  courseContent(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget courseHeader(context) {
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
        const Text(
          "BDD Course",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 32,
          ),
        ),
        const Text(
          "2nd year - IT",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
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
              const Text(
                "Djamila merid ",
                style: TextStyle(
                  fontFamily: AppFonts.mainFont,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
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
      Container(
        width: 105,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Color(AppColors.blue),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              "+4K",
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w600,
                color: Color(AppColors.blue),
                fontSize: 24,
              ),
            ),
            Text(
              "Students",
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w600,
                color: Color(AppColors.greyWritting),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        width: 20,
      ),
      Container(
        width: 105,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          border: Border.all(
            color: Color(AppColors.blue),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Text(
              "4.2/5",
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w600,
                color: Color(AppColors.blue),
                fontSize: 24,
              ),
            ),
            Text(
              "Course rate",
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w600,
                color: Color(AppColors.greyWritting),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget courseContent() {
  return Padding(
    padding: const EdgeInsets.only(right: 20),
    child: ListView.separated(
      scrollDirection: Axis.vertical,
      separatorBuilder: (context, index) => const SizedBox(
        height: 14,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return courseContentCard();
      },
    ),
  );
}

Widget courseContentCard() {
  return Container(
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
              "Chapter 05 (last one)",
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
  );
}
