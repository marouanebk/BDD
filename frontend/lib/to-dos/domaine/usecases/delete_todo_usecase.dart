import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/to-dos/domaine/entities/to_do_entity.dart';
import 'package:frontend/to-dos/domaine/repository/base_todo_repo.dart';

class DeleteTodoUseCase {
  final BaseToDoRepository repository;

  DeleteTodoUseCase(this.repository);

  Future<Either<Failure, Unit>> call(ToDo todo) async {
    return await repository.deleteToDO(todo);
  }
}
