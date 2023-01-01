// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:frontend/MainScreen/domaine/entities/course_content.dart';

class CourseDetails extends Equatable {
  final String title;
  final String year;
  final String description;
  final String teacherId;

  final String? courseid;
  final String? teacherName;
  final List<dynamic> courseContent;
  // final String teacherName;

  const CourseDetails({
    this.courseid,
    this.teacherName,
    required this.teacherId,
    required this.description,
    required this.year,
    required this.title,
    required this.courseContent,
    // required this.teacherName,
  });

  @override
  List<Object?> get props => [
        courseid,
        teacherName,
        description,
        year,
        title,
        courseContent,
        teacherId
        // teacherName,
      ];
}
