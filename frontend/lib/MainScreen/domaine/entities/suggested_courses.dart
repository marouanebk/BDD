// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Course extends Equatable {
  final String? courseid;
  final String? teacherid;
  final String year;
  final String title;

  const Course({
    this.courseid,
    this.teacherid,
    required this.year,
    required this.title,
  });

  @override
  List<Object?> get props => [
        courseid,
        teacherid,
        year,
        title,
      ];
}
