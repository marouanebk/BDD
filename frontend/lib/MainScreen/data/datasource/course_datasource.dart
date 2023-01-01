import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/MainScreen/data/model/course_detail_model.dart';
import 'package:frontend/MainScreen/data/model/course_model.dart';
import 'package:frontend/MainScreen/domaine/entities/suggested_courses.dart';
import 'package:frontend/cores/error/exceptions.dart';
import 'package:frontend/cores/network/error_message_model.dart';

abstract class BaseCourseRemoteDataSource {
  Future<List<Course>> getSuggestedCourses();
  Future<CourseDetailModel> getCourseDetail(String id);
  Future<Unit> addCourse(CourseDetailModel courseDetails);
}

class CourseRemoteDataSource extends BaseCourseRemoteDataSource {
  @override
  Future<List<Course>> getSuggestedCourses() async {
    final response = await Dio().get(
      "http://10.0.2.2:4000/courses/getCourse",
    );

    if (response.statusCode == 200) {
      return List<CourseModel>.from((response.data["result"] as List).map(
        (e) => CourseModel.fromJson(e),
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
      "http://10.0.2.2:4000/courses/getCourseByID/$id",
    );

    if (response.statusCode == 200) {
      return CourseDetailModel.fromJson(response.data['result']);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: response.statusCode,
              statusMessage: response.data['message']));
    }
  }

  @override
  Future<Unit> addCourse(CourseDetailModel courseDetails) async {
// SharedPreferences prefs = await SharedPreferences.getInstance();
//     final userid = prefs.getString("userid");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    final response = await Dio().post(
      "http://10.0.2.2:4000/course/addCourse",
      data: courseDetails.toJson(),
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: requestHeaders,
      ),
    );
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: response.statusCode,
              statusMessage: response.data['message']));
    }
  }
}
