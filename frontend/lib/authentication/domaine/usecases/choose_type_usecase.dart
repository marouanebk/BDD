import 'package:frontend/authentication/domaine/repository/user_repository.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class ChooseTypeUseCase {
  final BaseUserRepository repository;

  ChooseTypeUseCase(this.repository);

  Future<Either<Failure , int>> call(int number) async {
    return await repository.chooseType(number);
  }
}
