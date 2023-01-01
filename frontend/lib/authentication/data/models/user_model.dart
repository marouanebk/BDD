import 'package:frontend/authentication/domaine/entities/user_entitiy.dart';
import 'package:frontend/main.dart';

class UserModel extends User {
  const UserModel(
      {String? userid,
      String? fullname,
      String? biography,
      required String email,
       String? password})
      : super(
            userid: userid,
            fullname: fullname,
            email: email,
            password: password,
            biography: biography);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userid: json["userid"],
      fullname: json["fullname"],
      email: json["email"],
      password: json["password"],
      biography: json["biography"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "userid": userid,
      "fullname": fullname,
      "email": email,
      "password": password
    };
  }
}
