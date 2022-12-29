import 'package:frontend/MainScreen/domaine/entities/suggested_courses.dart';
import 'package:frontend/MainScreen/domaine/repository/base_course_repo.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetSuggestedCoursesUseCase {
  final BaseCourseRepository repository;

  GetSuggestedCoursesUseCase(this.repository);

  Future<Either<Failure, List<Course>>> call() async {
    return await repository.getSuggestedCourses();
  }
}
