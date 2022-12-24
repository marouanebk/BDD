import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:frontend/authentication/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/cores/error/exceptions.dart';
import 'package:frontend/cores/network/error_message_model.dart';
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

class UserRemoteDataSource extends BaseTodoRemoteDateSource {
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
  Future<List<ToDo>> getDoneToDo() {
    throw UnimplementedError();
  }

  @override
  Future<List<ToDo>> getUnDoneToDo() {
    throw UnimplementedError();
  }
}
