import 'package:frontend/to-dos/domaine/entities/to_do_entity.dart';

class TodoModel extends ToDo {
  const TodoModel({
    String? userid,
    required String description,
    required String etat,
  }) : super(userid: userid, description: description, etat: etat);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      userid: json["userid"],
      description: json["description"],
      etat: json["etat"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userid": userid,
      "description": description,
      "etat": etat,
    };
  }
}
