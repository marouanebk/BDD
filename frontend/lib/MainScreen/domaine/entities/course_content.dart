// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

class CourseContent extends Equatable {
  final String name;
  final String type;
  final String? url;
  final List<Quizz>? quizzContent;

  const CourseContent({
    required this.name,
    required this.type,
    this.url,
    this.quizzContent,
  });

  @override
  List<Object?> get props => [name, type, url, quizzContent];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name.toString(),
      'type': type.toString(),
      "url": (type == "pdf") ? url.toString() : null,
      'quizzContent': (type == "quizz")
          ? jsonEncode(quizzContent!.map((e) => e.toJson()).toList())
          : "",
    };
  }

  factory CourseContent.fromJson(Map<String, dynamic> json) {
    // var temp = List<Quizz>.from((json["quizzContent"] as List).map(
    //   (e) => Quizz.fromJson(e),
    // ));
    // log(List<Quizz>.from((json["quizzContent"] as List).map(
    //   (e) => Quizz.fromJson(e),
    // )).toString());
    return CourseContent(
      name: json["name"],
      type: json["type"],
      url: json["url"],
      quizzContent: (json["type"] == "quizz")
          ? List<Quizz>.from((json["quizzContent"] as List).map(
              (e) => Quizz.fromJson(e),
            ))
          : [],
      // teacherName: json["teacherName"],
    );
  }
}

class Quizz extends Equatable {
  final String? question;
  final List<String>? answers;
  final String? rightAnswer;

  const Quizz({
    this.question,
    this.answers,
    this.rightAnswer,
  });

  @override
  List<Object?> get props => [question, answers, rightAnswer];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'question': question,
      'answers': answers,
      'rightAnswer': rightAnswer,
    };
  }

// (jsonDecode(input) as List<dynamic>).cast<String>();
  factory Quizz.fromJson(Map<String, dynamic> json) {
    // log(json["answers"]);
    return Quizz(
      question: json["question"],
      // answers: json["answers"] as List<String>,

      answers: List<String>.from((json["answers"] as List).map(
        (e) => (e),
      )),
      rightAnswer: json["rightAnswer"],
      // teacherName: json["teacherName"],
    );
  }
}
