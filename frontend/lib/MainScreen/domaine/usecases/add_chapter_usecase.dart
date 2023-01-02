import 'package:frontend/MainScreen/domaine/entities/course_content.dart';
import 'package:frontend/MainScreen/domaine/repository/base_course_repo.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class AddChapterUseCase {
  final BaseCourseRepository repository;

  AddChapterUseCase(this.repository);

  Future<Either<Failure, Unit>> call(
      String id, CourseContent courseContent) async {
    return await repository.addChapter(id, courseContent);
  }
}
