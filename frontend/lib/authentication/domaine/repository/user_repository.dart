import 'package:dartz/dartz.dart';
import 'package:frontend/authentication/domaine/entities/user_entitiy.dart';
import 'package:frontend/cores/error/failure.dart';


abstract class BaseUserRepository {
  Future<Either<Failure, int>> loginUser(User user);

  Future<Either<Failure, bool>> createUser(User user);

  Future<Either<Failure, bool>> logout();

  Future<Either<Failure , int>> chooseType(int number);


}
