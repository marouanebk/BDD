import 'package:dartz/dartz.dart';
import 'package:frontend/authentication/data/models/user_model.dart';
import 'package:frontend/authentication/domaine/entities/user_entitiy.dart';
import 'package:frontend/cores/error/failure.dart';


abstract class BaseUserRepository {
  Future<Either<Failure, int>> loginUser(User user);

  Future<Either<Failure, bool>> createUser(User user);

  Future<Either<Failure, bool>> logout();
  
  Future<Either<Failure, UserModel>> getUserDetails(String id);

  Future<Either<Failure , int>> chooseType(int number);

  Future<Either<Failure , Unit>> setBiography(String bio);

    // Future<Either<Failure, List<UserModel>>> searchUsers(String id);





}
