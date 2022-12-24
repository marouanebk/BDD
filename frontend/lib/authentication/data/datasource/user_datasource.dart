import 'package:dio/dio.dart';
import 'package:frontend/authentication/data/models/user_model.dart';
import 'package:frontend/cores/error/exceptions.dart';
import 'package:frontend/cores/network/error_message_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseUserRemoteDateSource {
  Future<bool> createUser(UserModel userModel);
  Future<bool> loginUser(UserModel userModel);
  Future<bool> logOutUser();
}

class UserRemoteDataSource extends BaseUserRemoteDateSource {
  static var client = http.Client();

  @override
  Future<bool> createUser(UserModel userModel) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    final response = await Dio().post(
      "http://10.0.2.2:4000/users/register",
      data: userModel.toJson(),
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: requestHeaders,
      ),
    );

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('fullname', userModel.fullname!);
      await prefs.setString('email', userModel.email);

      return true;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: response.statusCode,
              statusMessage: response.data['message']));
    }
  }

  @override
  Future<bool> loginUser(UserModel userModel) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    final response = await Dio().post(
      "http://10.0.2.2:4000/users/login",
      data: userModel.toJson(),
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: requestHeaders,
      ),
    );

    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt('is logged in', 1);

      return true;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: response.statusCode,
              statusMessage: response.data['message']));
    }
  }

  @override
  Future<bool> logOutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('is logged in', 0);
    return true;
  }
}
