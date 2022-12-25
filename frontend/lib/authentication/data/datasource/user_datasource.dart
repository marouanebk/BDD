import 'package:dio/dio.dart';
import 'package:frontend/authentication/data/models/user_model.dart';
import 'package:frontend/cores/error/exceptions.dart';
import 'package:frontend/cores/network/error_message_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class BaseUserRemoteDateSource {
  Future<bool> createUser(UserModel userModel);
  Future<int> loginUser(UserModel userModel);
  Future<bool> logOutUser();
  Future<int> chooseType(int number);
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
      await prefs.setString('userid', userModel.userid!);
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
  Future<int> loginUser(UserModel userModel) async {
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
      await prefs.setString(
          'fullname', response.data["data"]['fullname'].toString());
      await prefs.setString('email', response.data["data"]['email'].toString());

      await prefs.setString(
          "userid", response.data["data"]['userid'].toString());
      final type = response.data["data"]["type"];
      if (type == "Teacher") {
        return 2;
      }
      return 1;
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
    await prefs.remove("fullanme");
    await prefs.remove('email');
    await prefs.remove("userid");

    return true;
  }

  @override
  Future<int> chooseType(int number) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    final prefs = await SharedPreferences.getInstance();

    final userid = prefs.getString("userid");

    var type = "Student";
    if (number == 2) {
      type = "Teacher";
    }
    final response = await Dio().put(
      "http://10.0.2.2:4000/users/changetype",
      data: {"userid": userid, "type": type},
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: requestHeaders,
      ),
    );

    if (response.statusCode == 200) {
      // return response.data["data"]["message"];
      return number;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel(
              statusCode: response.statusCode,
              statusMessage: response.data['message']));
    }
  }
}
