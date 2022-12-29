import 'package:equatable/equatable.dart';
import 'package:frontend/to-dos/domaine/entities/to_do_entity.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class GetDoneTodoEvent extends TodoEvent {}

class GetUnDoneTodoEvent extends TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final ToDo todo;
  const AddTodoEvent({required this.todo});

  @override
  List<Object> get props => [todo];
}

class EditTodoEvent extends TodoEvent {}

class DeleteTodoEvent extends TodoEvent {}
