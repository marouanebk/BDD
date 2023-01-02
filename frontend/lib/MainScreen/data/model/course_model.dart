import 'package:frontend/MainScreen/domaine/entities/suggested_courses.dart';

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
        teacherid: json["user"],
        year: json["year"],
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
