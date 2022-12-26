import 'package:flutter/material.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';
import 'package:frontend/cores/widgets/text_input_field.dart';

class NewCourse extends StatefulWidget {
  const NewCourse({super.key});

  @override
  State<NewCourse> createState() => _NewCourseState();
}

class _NewCourseState extends State<NewCourse> {
  final TextEditingController _couresName = TextEditingController();
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 77, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back)),
                  const Text(
                    "New Course",
                    style: TextStyle(
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF111111),
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              courseIndo(),
              const SizedBox(
                height: 18,
              ),
              //course content
              courseContent(),
              const SizedBox(
                height: 20,
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    border: Border.all(
                      color: const Color(0xFFD9D9D9),
                    ),
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      "Publish Course",
                      style: TextStyle(
                        fontFamily: AppFonts.mainFont,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget courseIndo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Course Name",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: Color(AppColors.writting),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(
              color: const Color(0xFFD9D9D9),
            ),
          ),
          child: TextFieldInput(
            hintText: "Enter course name",
            textEditingController: _couresName,
            textInputType: TextInputType.text,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Course Student Domaine",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: Color(AppColors.writting),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(
              color: const Color(0xFFD9D9D9),
            ),
          ),
          child: TextFieldInput(
            hintText: "Enter your biography",
            textEditingController: _couresName,
            textInputType: TextInputType.text,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Course Into",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: Color(AppColors.writting),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 140,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(
              color: const Color(0xFFD9D9D9),
            ),
          ),
          child: TextFieldInput(
            hintText: "Enter course into",
            textEditingController: _couresName,
            textInputType: TextInputType.text,
          ),
        ),
      ],
    );
  }

  Widget courseContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Course Content",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w700,
            color: Color(AppColors.writting),
            fontSize: 20,
          ),
        ),
        Text(
          "Course name",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: Color(AppColors.writting),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(
              color: const Color(0xFFD9D9D9),
            ),
          ),
          child: TextFieldInput(
            hintText: "Enter chapter name",
            textEditingController: _couresName,
            textInputType: TextInputType.text,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "chapter type",
          style: TextStyle(
            fontFamily: AppFonts.mainFont,
            fontWeight: FontWeight.w500,
            color: Color(AppColors.writting),
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),

        //row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
              child: Container(
                height: 41,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                      color: (index == 1)
                          ? Color(AppColors.blue)
                          : const Color(0xFFBEC5D1),
                      width: (index == 1) ? 2 : 1),
                ),
                child: Center(
                  child: Text(
                    "PDF",
                    style: TextStyle(
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.w500,
                      color: (index == 1)
                          ? Color(AppColors.blue)
                          : Color(AppColors.writting),
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  index = 2;
                });
              },
              child: Container(
                height: 41,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  border: Border.all(
                      color: (index == 2)
                          ? Color(AppColors.blue)
                          : const Color(0xFFBEC5D1),
                      width: (index == 2) ? 2 : 1),
                ),
                child: Center(
                  child: Text(
                    "QUIZ",
                    style: TextStyle(
                      fontFamily: AppFonts.mainFont,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: (index == 2)
                          ? Color(AppColors.blue)
                          : Color(AppColors.writting),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 45,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(
              color: const Color(0xFFD9D9D9),
            ),
          ),
          child: Center(
            child: Text(
              "Upload File",
              style: TextStyle(
                fontFamily: AppFonts.mainFont,
                fontWeight: FontWeight.w600,
                color: Color(AppColors.blue),
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
