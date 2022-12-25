import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/cores/utils/enums.dart';
import 'package:frontend/to-dos/domaine/usecases/add_todo_usecase.dart';
import 'package:frontend/to-dos/domaine/usecases/delete_todo_usecase.dart';
import 'package:frontend/to-dos/domaine/usecases/edit_todo_usecase.dart';
import 'package:frontend/to-dos/domaine/usecases/get_done_todo_usecase.dart';
import 'package:frontend/to-dos/domaine/usecases/get_undone_todo_usecase.dart';
import 'package:frontend/to-dos/presentation/controller/todo_bloc/todo_event.dart';
import 'package:frontend/to-dos/presentation/controller/todo_bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final GetDoneTodoUseCase getDoneTodoUseCase;
  final GetUnDoneTodoUseCase getUnDoneTodoUseCase;
  final AddTodoUseCase addTodoUseCase;
  final EditTodoUseCase editTodoUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;
  TodoBloc(this.getDoneTodoUseCase, this.getUnDoneTodoUseCase,
      this.addTodoUseCase, this.editTodoUseCase, this.deleteTodoUseCase)
      : super(const TodoState()) {
    on<GetDoneTodoEvent>(_getDoneTodoEvent);
    on<GetUnDoneTodoEvent>(_getUnDoneTodoEvent);
    on<AddTodoEvent>(_addTodoEvent);
    on<EditTodoEvent>(_editTodoEvent);
    on<DeleteTodoEvent>(_deleteTodoEvent);
  }
  FutureOr<void> _getDoneTodoEvent(
      GetDoneTodoEvent event, Emitter<TodoState> emit) async {
    final result = await getDoneTodoUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            getDoneTodoState: RequestState.error,
            getDoneTodomessage: l.message)),
        (r) => emit(state.copyWith(
            getDoneTodo: r, getDoneTodoState: RequestState.loaded)));
  }

  FutureOr<void> _getUnDoneTodoEvent(
      GetUnDoneTodoEvent event, Emitter<TodoState> emit) async {
    final result = await getDoneTodoUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            getDoneTodoState: RequestState.error,
            getDoneTodomessage: l.message)),
        (r) => emit(state.copyWith(
            getDoneTodo: r, getDoneTodoState: RequestState.loaded)));
  }

  FutureOr<void> _addTodoEvent(
      AddTodoEvent event, Emitter<TodoState> emit) async {
    final result = await getDoneTodoUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            getDoneTodoState: RequestState.error,
            getDoneTodomessage: l.message)),
        (r) => emit(state.copyWith(
            getDoneTodo: r, getDoneTodoState: RequestState.loaded)));
  }

  FutureOr<void> _editTodoEvent(
      EditTodoEvent event, Emitter<TodoState> emit) async {
    final result = await getDoneTodoUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            getDoneTodoState: RequestState.error,
            getDoneTodomessage: l.message)),
        (r) => emit(state.copyWith(
            getDoneTodo: r, getDoneTodoState: RequestState.loaded)));
  }

  FutureOr<void> _deleteTodoEvent(
      DeleteTodoEvent event, Emitter<TodoState> emit) async {
    final result = await getDoneTodoUseCase();
    result.fold(
        (l) => emit(state.copyWith(
            getDoneTodoState: RequestState.error,
            getDoneTodomessage: l.message)),
        (r) => emit(state.copyWith(
            getDoneTodo: r, getDoneTodoState: RequestState.loaded)));
  }
}
