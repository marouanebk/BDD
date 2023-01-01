import 'package:frontend/authentication/data/models/user_model.dart';
import 'package:frontend/authentication/domaine/entities/user_entitiy.dart';
import 'package:frontend/authentication/domaine/repository/user_repository.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class GetUserDetailsUseCase {
  final BaseUserRepository repository;

  GetUserDetailsUseCase(this.repository);

  Future<Either<Failure, UserModel>> call(String id) async {
    return await repository.getUserDetails(id);
  }
}
