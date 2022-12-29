import 'package:dartz/dartz.dart';
import 'package:frontend/MainScreen/domaine/entities/course_detail_entity.dart';
import 'package:frontend/MainScreen/domaine/entities/suggested_courses.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:frontend/to-dos/domaine/entities/to_do_entity.dart';

abstract class BaseCourseRepository {
  Future<Either<Failure, List<Course>>> getSuggestedCourses();
  Future<Either<Failure, CourseDetails>> getCourseDetail(String id);

}
