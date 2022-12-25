import 'package:frontend/authentication/data/datasource/user_datasource.dart';
import 'package:frontend/authentication/data/models/user_model.dart';
import 'package:frontend/authentication/domaine/repository/user_repository.dart';
import 'package:frontend/cores/error/exceptions.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';

class UserRepository implements BaseUserRepository {
  final BaseUserRemoteDateSource baseUserRemoteDateSource;

  UserRepository(this.baseUserRemoteDateSource);

  @override
  Future<Either<Failure, bool>> createUser(user) async {
    final UserModel userModel = UserModel(
        userid: user.userid,
        fullname: user.fullname,
        email: user.email,
        password: user.password);

    try {
      final result = await baseUserRemoteDateSource.createUser(userModel);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, int>> loginUser(user) async {
    final UserModel userModel = UserModel(
      userid: user.userid,
      fullname: user.fullname,
      email: user.email,
      password: user.password,
    );

    try {
      final result = await baseUserRemoteDateSource.loginUser(userModel);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    try {
      final result = await baseUserRemoteDateSource.logOutUser();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> chooseType(int number) async {
    try {
      final result = await baseUserRemoteDateSource.chooseType(number);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
