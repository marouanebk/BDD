import 'package:equatable/equatable.dart';
import 'package:frontend/cores/utils/enums.dart';
import 'package:frontend/to-dos/domaine/entities/to_do_entity.dart';

class TodoState extends Equatable {
  final List<ToDo> getDoneTodo;
  final RequestState getDoneTodoState;
  final String getDoneTodomessage;
  //
  final List<ToDo> getUnDoneTodo;
  final RequestState getUnDoneTodoState;
  final String getUnDoneTodomessage;

  // final ToDo addTodo;
  final RequestState addTodoState;
  final String addTodoMessage;

  const TodoState({
    this.getDoneTodo = const [],
    this.getDoneTodoState = RequestState.loading,
    this.getDoneTodomessage = "",
    //
    this.getUnDoneTodo = const [],
    this.getUnDoneTodoState = RequestState.loading,
    this.getUnDoneTodomessage = "",
    //
    this.addTodoState = RequestState.loading,
    this.addTodoMessage = "",
  });

  TodoState copyWith({
    List<ToDo>? getDoneTodo,
    RequestState? getDoneTodoState,
    String? getDoneTodomessage,
    //
    List<ToDo>? getUnDoneTodo,
    RequestState? getUnDoneTodoState,
    String? getUnDoneTodomessage,
    //
    RequestState? addTodoState,
    String? addTodoMessage,
  }) {
    return TodoState(
      getDoneTodo: getDoneTodo ?? this.getDoneTodo,
      getDoneTodoState: getDoneTodoState ?? this.getDoneTodoState,
      getDoneTodomessage: getDoneTodomessage ?? this.getDoneTodomessage,
      //
      getUnDoneTodo: getUnDoneTodo ?? this.getUnDoneTodo,
      getUnDoneTodoState: getUnDoneTodoState ?? this.getUnDoneTodoState,
      getUnDoneTodomessage: getUnDoneTodomessage ?? this.getUnDoneTodomessage,
      //
      addTodoState: addTodoState ?? this.addTodoState,
      addTodoMessage: addTodoMessage ?? this.addTodoMessage,
    );
    //
  }

  @override
  List<Object?> get props => [
        getDoneTodo,
        getDoneTodoState,
        getDoneTodomessage,
        //
        getUnDoneTodo,
        getUnDoneTodoState,
        getUnDoneTodomessage,
        
        addTodoState,
        addTodoMessage,
        //
      ];
}
