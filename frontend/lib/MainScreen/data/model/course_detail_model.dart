import 'package:frontend/MainScreen/domaine/entities/course_detail_entity.dart';

class CourseDetailModel extends CourseDetails {
  const CourseDetailModel({
    String? courseid,
    String? teacherid,
    required String year,
    required String title,
    required String description,
    // required String teacherName,
  }) : super(
          courseid: courseid,
          title: title,
          teacherid: teacherid,
          year: year,
          description: description,
          // teacherName: teacherName,
        );

  factory CourseDetailModel.fromJson(Map<String, dynamic> json) {
    return CourseDetailModel(
      courseid: json["_id"],
      teacherid: json["user"],
      year: json["year"],
      title: json["title"],
      description: json["description"],
      // teacherName: json["teacherName"],
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
