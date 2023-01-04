import 'dart:convert';
import 'dart:developer';

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
    required List<dynamic> courseContent,
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
    // String jsonContent = "";
    // if (courseContent[0].quizzContent != null)
    //   String jsonContent = jsonEncode(courseContent[0].quizzContent);
    // log(courseContent[0].quizzContent.question.toString());
    var quizz = courseContent[0].quizzContent as List<Quizz>;
    log("");
    print(quizz);
    var tempo = jsonEncode(
        courseContent[0].quizzContent.map((e) => e.toJson()).toList());

    // var tempo = jsonEncode(
    //     courseContent[0].quizzContent.map((e) => e.toJson()).toList());
    

    // for (var i in courseContent[0].quizzContent) {
    //   log(jsonEncode(i));
    // }

    return {
      "title": title,
      "year": year,
      "description": description,
      "courseContent": {
        "name": courseContent[0].name.toString(),
        "type": courseContent[0].type.toString(),
        "url": courseContent[0].url.toString(),
        "quizzContent": tempo
        // jsonEncode(courseContent[0].quizzContent as List<Quizz>)
        // {
        //   for (var i in courseContent[0].quizzContent) jsonEncode(i) as Quizz,
        // }

        // jsonEncode(courseContent[0].quizzContent)
        // {
        //   "question": courseContent[0].quizzContent.question.toString(),
        //   "answers": courseContent[0].quizzContent.answers,
        //   "rightAnswer": courseContent[0].quizzContent.rightAnswer
        // },
      },
      "user": teacherId,
    };
  }
}
