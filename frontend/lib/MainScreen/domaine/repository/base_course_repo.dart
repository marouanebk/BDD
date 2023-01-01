import 'package:dartz/dartz.dart';
import 'package:frontend/MainScreen/domaine/entities/course_detail_entity.dart';
import 'package:frontend/MainScreen/domaine/entities/suggested_courses.dart';
import 'package:frontend/cores/error/failure.dart';

abstract class BaseCourseRepository {
  Future<Either<Failure, List<Course>>> getSuggestedCourses();
  Future<Either<Failure, CourseDetails>> getCourseDetail(String id);

  Future<Either<Failure, Unit>> addCourse(CourseDetails courseDetails);
}
