
import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class GetDoneTodoEvent extends TodoEvent {}
class GetUnDoneTodoEvent extends TodoEvent {}
class AddTodoEvent extends TodoEvent {}
class EditTodoEvent extends TodoEvent {}
class DeleteTodoEvent extends TodoEvent {}

