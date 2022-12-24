import 'package:frontend/cores/error/exceptions.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/to-dos/data/datasource/todo_datasource.dart';
import 'package:frontend/to-dos/domaine/entities/to_do_entity.dart';
import 'package:frontend/to-dos/domaine/repository/base_todo_repo.dart';

class TodoRepository implements BaseToDoRepository {
  final BaseTodoRemoteDateSource baseTodoRemoteDateSource;

  TodoRepository(this.baseTodoRemoteDateSource);

  @override
  Future<Either<Failure, Unit>> addToDo(ToDo todo) async {
    try {
      final result = await baseTodoRemoteDateSource.addToDo(todo);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteToDO(ToDo todo) async {
    try {
      final result = await baseTodoRemoteDateSource.deleteToDO(todo);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Unit>> editToDO(ToDo todo) async {
    try {
      final result = await baseTodoRemoteDateSource.editToDO(todo);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ToDo>>> getDoneToDo() async {
    try {
      final result = await baseTodoRemoteDateSource.getDoneToDo();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ToDo>>> getUnDoneToDo() async {
    try {
      final result = await baseTodoRemoteDateSource.getUnDoneToDo();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
