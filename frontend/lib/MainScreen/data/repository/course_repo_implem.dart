import 'package:frontend/MainScreen/data/datasource/course_datasource.dart';
import 'package:frontend/MainScreen/data/model/course_detail_model.dart';
import 'package:frontend/MainScreen/data/model/course_model.dart';
import 'package:frontend/MainScreen/domaine/entities/course_content.dart';
import 'package:frontend/MainScreen/domaine/entities/course_detail_entity.dart';
import 'package:frontend/MainScreen/domaine/entities/suggested_courses.dart';
import 'package:frontend/MainScreen/domaine/repository/base_course_repo.dart';
import 'package:frontend/authentication/data/models/user_model.dart';
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
  Future<Either<Failure, Unit>> addCourse(CourseDetails courseDetails) async {
    CourseDetailModel courseModel = CourseDetailModel(
        teacherId: courseDetails.teacherId,
        title: courseDetails.title,
        year: courseDetails.year,
        description: courseDetails.description,
        courseContent: courseDetails.courseContent);
    try {
      final result = await baseCourseRemoteDataSource.addCourse(courseModel);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Course>>> getCourseByTeacher(String id) async {
    try {
      final result = await baseCourseRemoteDataSource.getCoursesByTeacher(id);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Unit>> addChapter(
      String id, CourseContent courseContent) async {
    try {
      final result =
          await baseCourseRemoteDataSource.addChapter(id, courseContent);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<UserModel>>> searchUsers(String key) async {
    try {
      final result = await baseCourseRemoteDataSource.searchUsers(key);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<CourseModel>>> searchCourses(String key) async {
    try {
      final result = await baseCourseRemoteDataSource.searchCourses(key);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<CourseModel>>> getEnrolledCourses() async {
    try {
      final result = await baseCourseRemoteDataSource.getEnrolledCourses();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Unit>> enrollCourse(String id) async {
    try {
      final result = await baseCourseRemoteDataSource.enrollCourse(id);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
