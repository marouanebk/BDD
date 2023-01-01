import 'package:frontend/MainScreen/domaine/entities/course_detail_entity.dart';
import 'package:frontend/MainScreen/domaine/repository/base_course_repo.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class AddCourseUseCase {
  final BaseCourseRepository repository;

  AddCourseUseCase(this.repository);

  Future<Either<Failure, Unit>> call(CourseDetails course) async {
    return await repository.addCourse(course);
  }
}
