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
 
  const TodoState({
    this.getDoneTodo = const [],
    this.getDoneTodoState = RequestState.loading,
    this.getDoneTodomessage = "",
    //
    this.getUnDoneTodo = const [],
    this.getUnDoneTodoState = RequestState.loading,
    this.getUnDoneTodomessage = "",
    //
   
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
   
  }) {
    return TodoState(
        getDoneTodo:getDoneTodo ?? this.getDoneTodo,
        getDoneTodoState:getDoneTodoState ?? this.getDoneTodoState,
        getDoneTodomessage:getDoneTodomessage ?? this.getDoneTodomessage,
        //
        getUnDoneTodo: getUnDoneTodo ?? this.getUnDoneTodo,
        getUnDoneTodoState: getUnDoneTodoState ?? this.getUnDoneTodoState,
        getUnDoneTodomessage:
getUnDoneTodomessage ?? this.getUnDoneTodomessage,
        //
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
        //
      ];
}

