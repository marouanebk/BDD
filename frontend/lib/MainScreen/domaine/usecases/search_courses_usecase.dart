import 'package:frontend/MainScreen/data/model/course_model.dart';
import 'package:frontend/MainScreen/domaine/repository/base_course_repo.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class SearchCoursesUseCase {
  final BaseCourseRepository repository;

  SearchCoursesUseCase(this.repository);

  Future<Either<Failure, List<CourseModel>>> call(String key) async {
    return await repository.searchCourses(key);
  }
}
