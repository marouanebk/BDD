import 'package:frontend/MainScreen/domaine/repository/base_course_repo.dart';
import 'package:frontend/authentication/data/models/user_model.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class SearchUsersUsecase {
  final BaseCourseRepository repository;

  SearchUsersUsecase(this.repository);

  Future<Either<Failure, List<UserModel>>> call(String key) async {
    return await repository.searchUsers(key);
  }
}
