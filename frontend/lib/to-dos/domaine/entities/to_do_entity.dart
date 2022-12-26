import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  final String? userid;
  final String todo;
  final String status;

  const ToDo({
    this.userid,
    required this.todo,
    required this.status,
  });

  @override
  List<Object?> get props => [
        userid,
        todo,
        status,
      ];
}
