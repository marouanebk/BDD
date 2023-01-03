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
      'name': name,
      'type': type,
      'url': url,
      'quizzContent': quizzContent,
    };
  }
}

class Quizz extends Equatable {
  final String question;
  final List<String> answers;
  final String rightAnswer;

  const Quizz({
    required this.question,
    required this.answers,
    required this.rightAnswer,
  });

  @override
  List<Object?> get props => [question, answers, rightAnswer, rightAnswer];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'question': question,
      'answers': answers,
      'rightAnswer': rightAnswer,
    };
  }
}
