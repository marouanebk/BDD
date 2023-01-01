import 'package:frontend/MainScreen/domaine/entities/course_content.dart';
import 'package:frontend/MainScreen/domaine/entities/course_detail_entity.dart';

class CourseDetailModel extends CourseDetails {
  const CourseDetailModel({
    String? courseid,
    String? teacherName,
    required String teacherId,
    required String title,
    required String year,
    required String description,
    required List<CourseContent> courseContent,
    // required String teacherName,
  }) : super(
            teacherId: teacherId,
            courseid: courseid,
            title: title,
            teacherName: teacherName,
            year: year,
            description: description,
            courseContent: courseContent
            // teacherName: teacherName,
            );

  factory CourseDetailModel.fromJson(Map<String, dynamic> json) {
    return CourseDetailModel(
        courseid: json["course"]["_id"],
        teacherName: json["fullname"],
        year: json["course"]["year"],
        title: json["course"]["title"],
        description: json["course"]["description"],
        courseContent: json["course"]["courseContent"],
        teacherId: json["course"]["user"]
        // teacherName: json["teacherName"],
        );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "year": year,
      "description": description,
      "courseContent": courseContent,
      "user": teacherId,
    };
  }
}
