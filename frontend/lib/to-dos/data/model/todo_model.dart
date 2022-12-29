import 'package:frontend/to-dos/domaine/entities/to_do_entity.dart';

class TodoModel extends ToDo {
  const TodoModel({
    String? todoid,
    String? userid,
    required String todo,
    required String status,
  }) : super(todoid: todoid, userid: userid, todo: todo, status: status);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      todoid: json["_id"],
      userid: json["userid"],
      todo: json["todo"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userid": userid,
      "todo": todo,
      "status": status,
    };
  }
}
