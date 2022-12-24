import 'package:frontend/authentication/domaine/entities/user_entitiy.dart';

class UserModel extends User {
  const UserModel(
      {String? userid,
      String ?fullname,
      required String email,
      required String password})
      : super(userid: userid, fullname: fullname, email: email, password: password);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userid: json["userid"],
        fullname: json["fullname"],
        email: json["email"],
        password: json["password"]);
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
