import 'package:frontend/MainScreen/domaine/entities/course_detail_entity.dart';
import 'package:frontend/MainScreen/domaine/repository/base_course_repo.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetCoursedDetailUseCase {
  final BaseCourseRepository repository;

  GetCoursedDetailUseCase(this.repository);

  Future<Either<Failure, CourseDetails>> call(String id) async {
    return await repository.getCourseDetail(id);
  }
}
