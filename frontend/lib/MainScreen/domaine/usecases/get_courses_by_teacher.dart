import 'package:frontend/MainScreen/domaine/entities/suggested_courses.dart';
import 'package:frontend/MainScreen/domaine/repository/base_course_repo.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetCoursesByTeacherUseCase {
  final BaseCourseRepository repository;

  GetCoursesByTeacherUseCase(this.repository);

  Future<Either<Failure, List<Course>>> call(String id) async {
    return await repository.getCourseByTeacher(id);
  }
}
