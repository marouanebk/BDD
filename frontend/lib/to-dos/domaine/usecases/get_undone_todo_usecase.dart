import 'package:frontend/cores/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/to-dos/domaine/entities/to_do_entity.dart';
import 'package:frontend/to-dos/domaine/repository/base_todo_repo.dart';

class GetUnDoneTodoUseCase {
  final BaseToDoRepository repository;

  GetUnDoneTodoUseCase(this.repository);

  Future<Either<Failure, List<ToDo>>> call() async {
    return await repository.getUnDoneToDo();
  }
}
