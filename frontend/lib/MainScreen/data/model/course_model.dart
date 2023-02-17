import 'package:frontend/MainScreen/domaine/entities/suggested_courses.dart';

class CourseModel extends Course {
  const CourseModel({
    String? courseid,
    String? teacherid,
    String? picture,
    required String year,
    required String title,
  }) : super(
          courseid: courseid,
          title: title,
          teacherid: teacherid,
          year: year,
          picture: picture,
        );

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      courseid: json["_id"],
      teacherid: json["user"]["id"],
      year: json["year"],
      title: json["title"],
      picture: json["user"]["profile_picture"],
    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "userid": userid,
  //     "todo": todo,
  //     "status": status,
  //   };
  // }
}
