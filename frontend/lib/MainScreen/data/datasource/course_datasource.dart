import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/MainScreen/data/model/course_detail_model.dart';
import 'package:frontend/MainScreen/data/model/course_model.dart';
import 'package:frontend/MainScreen/domaine/entities/suggested_courses.dart';
import 'package:frontend/cores/error/exceptions.dart';
import 'package:frontend/cores/network/error_message_model.dart';
import 'package:frontend/to-dos/data/model/todo_model.dart';


abstract class BaseCourseRemoteDataSource {
  Future<List<Course>> getSuggestedCourses();
  Future<CourseDetailModel> getCourseDetail(String id);
}

class CourseRemoteDataSource extends BaseCourseRemoteDataSource {

  @override
  Future<List<Course>> getSuggestedCourses() async {


    final response = await Dio().get(
      "http://10.0.2.2:4000/todos/undone/",
    );
    if (response.statusCode == 200) {
      return List<CourseModel>.from((response.data["todo"] as List).map(
        (e) => TodoModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: response.statusCode,
              statusMessage: response.data['message']));
    }
  }

  @override
  Future<CourseDetailModel> getCourseDetail(String id) async {


    final response = await Dio().get(
      "http://10.0.2.2:4000/todos/undone/$id",
    );
    if (response.statusCode == 200) {
      return response.data['result'];
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: response.statusCode,
              statusMessage: response.data['message']));
    }
  }
}
