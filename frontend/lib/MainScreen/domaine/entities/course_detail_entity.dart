// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CourseDetails extends Equatable {
  final String? courseid;
  final String? teacherid;
  final String description;
  final String year;
  final String title;
  final String teacherName;

  const CourseDetails({
    this.courseid,
    this.teacherid,
    required this.description,
    required this.year,
    required this.title,
    required this.teacherName,
  });

  @override
  List<Object?> get props => [
        courseid,
        teacherid,
        description,
        year,
        title,
        teacherName,
      ];
}
