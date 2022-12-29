import 'package:frontend/MainScreen/domaine/entities/suggested_courses.dart';
import 'package:frontend/to-dos/domaine/entities/to_do_entity.dart';

class CourseModel extends Course {
  const CourseModel({
    String? courseid,
    String? teacherid,
    required String year,
    required String title,
  }) : super(
          courseid: courseid,
          title: title,
          teacherid: teacherid,
          year: year,
        );

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
        courseid: json["_id"],
        teacherid: json["userid"],
        year: json["todo"],
        title: json["title"]);
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "userid": userid,
  //     "todo": todo,
  //     "status": status,
  //   };
  // }
}
