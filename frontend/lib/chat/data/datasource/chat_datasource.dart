import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:frontend/chat/data/model/conversation_model.dart';
import 'package:frontend/chat/data/model/message_model.dart';

import 'package:frontend/cores/error/exceptions.dart';
import 'package:frontend/cores/network/api_constants.dart';
import 'package:frontend/cores/network/error_message_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseChatRemoteDataSource {
  Future<Unit> addCovnersation(String toId);
  Future<List<ConversationModel>> getAllConversations();
  Future<List<MessageModel>> getMessages(String courseId);
  Future<Unit> sendMessage(MessageModel messageModel);
}

class ChatRemoteDataSource extends BaseChatRemoteDataSource {
  @override
  Future<Unit> addCovnersation(String toId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    final response = await Dio().post(
      ApiConstance.addConversation,
      data: {"from": userid, "to": toId},
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: requestHeaders,
      ),
    );
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
  Future<List<ConversationModel>> getAllConversations() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString("userid");

    final response = await Dio().get(
      ApiConstance.getAllConversations(userid!),
    );

    if (response.statusCode == 200) {
      return List<ConversationModel>.from((response.data['result'] as List).map(
        (e) => ConversationModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: response.statusCode,
              statusMessage: response.data['message']));
    }
  }

  @override
  Future<List<MessageModel>> getMessages(String courseId) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // final userid = prefs.getString("userid");

    final response = await Dio().get(
      ApiConstance.getMessage(courseId),
    );
    if (response.statusCode == 200) {
      return List<MessageModel>.from((response.data['result'] as List).map(
        (e) => MessageModel.fromJson(e),
      ));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: response.statusCode,
              statusMessage: response.data['message']));
    }
  }

  @override
  Future<Unit> sendMessage(MessageModel messageModel) async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // final userid = prefs.getString("userid");
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    final response = await Dio().post(
      ApiConstance.addMessage,
      data: messageModel,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: requestHeaders,
      ),
    );
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
