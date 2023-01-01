import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class StudentCourses extends StatefulWidget {
  const StudentCourses({super.key});

  @override
  State<StudentCourses> createState() => _StudentCoursesState();
}

class _StudentCoursesState extends State<StudentCourses> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("student courses"),
    );
  }
}
