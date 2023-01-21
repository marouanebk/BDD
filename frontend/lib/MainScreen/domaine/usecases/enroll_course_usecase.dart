import 'package:frontend/MainScreen/domaine/repository/base_course_repo.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class EnrollCourseUseCase {
  final BaseCourseRepository repository;

  EnrollCourseUseCase(this.repository);

  Future<Either<Failure, Unit>> call(String id) async {
    return await repository.enrollCourse(id);
  }
}
