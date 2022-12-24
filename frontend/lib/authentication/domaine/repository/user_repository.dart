import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:frontend/authentication/domaine/entities/user_entitiy.dart';
import 'package:frontend/cores/error/failure.dart';


abstract class BaseUserRepository {
  Future<Either<Failure, bool>> loginUser(User user);

  Future<Either<Failure, bool>> createUser(User user);

  Future<Either<Failure, bool>> logout();


}
