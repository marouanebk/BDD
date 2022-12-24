import 'package:frontend/authentication/domaine/entities/user_entitiy.dart';
import 'package:frontend/authentication/domaine/repository/user_repository.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class CreateUserUseCase {
  final BaseUserRepository repository;

  CreateUserUseCase(this.repository);

  Future<Either<Failure, bool>> call(User user) async {
    return await repository.createUser(user);
  }
}

