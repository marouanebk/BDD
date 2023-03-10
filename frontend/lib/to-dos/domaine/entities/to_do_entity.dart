// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  final String? todoid;
  final String? userid;
  final String todo;
  final String status;

  const ToDo({
    this.todoid,
    this.userid,
    required this.todo,
    required this.status,
  });

  @override
  List<Object?> get props => [todoid, userid, todo, status];
}
