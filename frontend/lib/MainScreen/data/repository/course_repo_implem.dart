import 'package:frontend/MainScreen/data/datasource/course_datasource.dart';
import 'package:frontend/MainScreen/domaine/entities/course_detail_entity.dart';
import 'package:frontend/MainScreen/domaine/entities/suggested_courses.dart';
import 'package:frontend/MainScreen/domaine/repository/base_course_repo.dart';
import 'package:frontend/cores/error/exceptions.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';


class CourseRepository implements BaseCourseRepository {
  final BaseCourseRemoteDataSource baseCourseRemoteDataSource;

  CourseRepository(this.baseCourseRemoteDataSource);

  @override
  Future<Either<Failure, List<Course>>> getSuggestedCourses() async {
    try {
      final result = await baseCourseRemoteDataSource.getSuggestedCourses();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, CourseDetails>> getCourseDetail(String id) async {
    try {
      final result = await baseCourseRemoteDataSource.getCourseDetail(id);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
  
  @override
  Future<Either<Failure, Unit>> addCourse(CourseDetails CourseDetails) {
    // TODO: implement addCourse
    throw UnimplementedError();
  }
}
