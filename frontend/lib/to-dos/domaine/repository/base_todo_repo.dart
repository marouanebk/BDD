import 'package:dartz/dartz.dart';
import 'package:frontend/cores/error/failure.dart';
import 'package:frontend/to-dos/domaine/entities/to_do_entity.dart';

abstract class BaseToDoRepository {
  Future<Either<Failure, List<ToDo>>> getDoneToDo();
  Future<Either<Failure, List<ToDo>>> getUnDoneToDo();

  Future<Either<Failure, Unit>> addToDo(ToDo todo);
  Future<Either<Failure, Unit>> deleteToDO(ToDo todo);
  Future<Either<Failure, Unit>> editToDO(ToDo todo);
}
