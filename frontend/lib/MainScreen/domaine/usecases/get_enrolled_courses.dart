import 'package:frontend/MainScreen/data/model/course_model.dart';
import 'package:frontend/MainScreen/domaine/repository/base_course_repo.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetEnrolledCoursesUseCase {
  final BaseCourseRepository repository;

  GetEnrolledCoursesUseCase(this.repository);

  Future<Either<Failure, List<CourseModel>>> call(String id) async {
    return await repository.getEnrolledCourses(id);
  }
}
