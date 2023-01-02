import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/cores/error/exceptions.dart';
import 'package:frontend/cores/network/error_message_model.dart';
import 'package:frontend/to-dos/data/model/todo_model.dart';
import 'package:frontend/to-dos/domaine/entities/to_do_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseTodoRemoteDateSource {
  Future<Unit> addToDo(TodoModel todo);
  Future<Unit> deleteToDO(ToDo todo);
  Future<Unit> editToDO(ToDo todo);
  Future<List<ToDo>> getDoneToDo();
  Future<List<ToDo>> getUnDoneToDo();
}

class TodoRemoteDataSource extends BaseTodoRemoteDateSource {
  @override
  Future<Unit> addToDo(TodoModel todo) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // final userid = prefs.getString("userid");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    final response = await Dio().post(
      "http://10.0.2.2:4000/add/todo",
      data: todo.toJson(),
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

  @override
  Future<Unit> deleteToDO(ToDo todo) {
    throw UnimplementedError();
  }

  @override
  Future<Unit> editToDO(ToDo todo) {
    throw UnimplementedError();
  }

  @override
  Future<List<ToDo>> getDoneToDo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");

    final response = await Dio().get(
      "http://10.0.2.2:4000/todos/done/$userid",
    );
    log("response");
    if (response.statusCode == 200) {
      return List<TodoModel>.from((response.data["todo"] as List).map(
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
  Future<List<ToDo>> getUnDoneToDo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");

    final response = await Dio().get(
      "http://10.0.2.2:4000/todos/undone/$userid",
    );
    if (response.statusCode == 200) {
      return List<TodoModel>.from((response.data["todo"] as List).map(
        (e) => TodoModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: response.statusCode,
              statusMessage: response.data['message']));
    }
  }
}
