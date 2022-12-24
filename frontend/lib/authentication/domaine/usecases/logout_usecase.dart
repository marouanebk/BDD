import 'package:frontend/authentication/domaine/repository/user_repository.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class LogOutUseCase {
  final BaseUserRepository repository;

  LogOutUseCase(this.repository);

  Future<Either<Failure, bool>> call() async {
    return await repository.logout();
  }
}

