import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/cores/const/colors.dart';
import 'package:frontend/cores/const/const.dart';

class StatsPage extends StatefulWidget {
  const StatsPage({super.key});

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  int students = 0;
  int teachers = 0;
  int courses = 0;

  void getData() async {
    final response = await Dio().get(
      "http://10.0.2.2:4000/counter/counter",
    );
    log(response.data['result']['student'].toString());
    setState(() {
      students = response.data['result']['student'];
      teachers = response.data['result']['teacher'];
      courses = response.data['result']['courses'];
    });
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Admin analytics",
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w600,
                    color: Color(AppColors.writting),
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Overall statistics",
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
              firstRow(courses, teachers),
              const SizedBox(
                height: 16,
              ),
              secondRow(students),
            ],
          ),
        ),
      ),
    );
  }

  Widget firstRow(courses, teachers) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 111,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(width: 2, color: Colors.white),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0085FF),
                  Color(0xFF71BBFF),
                ],
              ),
            ),
            padding: const EdgeInsets.only(top: 12, left: 5, right: 5),
            child: Column(
              children: [
                const Text(
                  "Number of Courses",
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  courses.toString(),
                  style: const TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 48,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        // second
        Expanded(
          child: Container(
            height: 111,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(width: 2, color: const Color(0xFF0085FF)),
                color: Colors.white),
            padding: const EdgeInsets.only(top: 12, left: 5, right: 5),
            child: Column(
              children: [
                const Text(
                  "Number of Teaachers",
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0085FF),
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  teachers.toString(),
                  style: const TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0085FF),
                    fontSize: 48,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget secondRow(students) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 111,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(width: 2, color: const Color(0xFF0085FF)),
                color: Colors.white),
            padding: const EdgeInsets.only(top: 12, left: 5, right: 5),
            child: Column(
              children: const [
                Text(
                  "Number of Teaachers",
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0085FF),
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "12",
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0085FF),
                    fontSize: 48,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 111,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(width: 2, color: Colors.white),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0085FF),
                  Color(0xFF71BBFF),
                ],
              ),
            ),
            padding: const EdgeInsets.only(top: 12, left: 5, right: 5),
            child: Column(
              children: [
                const Text(
                  "Number of students",
                  style: TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  students.toString(),
                  style: const TextStyle(
                    fontFamily: AppFonts.mainFont,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: 48,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
