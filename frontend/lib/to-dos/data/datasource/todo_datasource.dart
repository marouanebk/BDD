import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/cores/error/exceptions.dart';
import 'package:frontend/cores/network/error_message_model.dart';
import 'package:frontend/to-dos/data/model/todo_model.dart';
import 'package:frontend/to-dos/domaine/entities/to_do_entity.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

abstract class BaseTodoRemoteDateSource {
  Future<Unit> addToDo(ToDo todo);
  Future<Unit> deleteToDO(ToDo todo);
  Future<Unit> editToDO(ToDo todo);
  Future<List<ToDo>> getDoneToDo();
  Future<List<ToDo>> getUnDoneToDo();
}

class TodoRemoteDataSource extends BaseTodoRemoteDateSource {
  static var client = http.Client();

  @override
  Future<Unit> addToDo(ToDo todo) {
    throw UnimplementedError();
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
