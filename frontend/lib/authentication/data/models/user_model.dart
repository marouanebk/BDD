import 'package:frontend/authentication/domaine/entities/user_entitiy.dart';

class UserModel extends User {
  const UserModel({
    String? userid,
    String? fullname,
    String? biography,
    required String email,
    String? password,
    String? profilePicture,
  }) : super(
            userid: userid,
            fullname: fullname,
            email: email,
            password: password,
            biography: biography,
            profilePicture: profilePicture);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        userid: json["userid"],
        fullname: json["fullname"],
        email: json["email"],
        password: json["password"],
        biography: json["biography"],
        profilePicture: json["profile_picture"]);
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
