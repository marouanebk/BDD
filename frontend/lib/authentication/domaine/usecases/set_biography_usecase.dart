import 'package:frontend/authentication/domaine/repository/user_repository.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class SetBiographyUseCase {
  final BaseUserRepository repository;

  SetBiographyUseCase(this.repository);

  Future<Either<Failure , Unit>> call(String bio) async {
    return await repository.setBiography(bio);
  }
}
