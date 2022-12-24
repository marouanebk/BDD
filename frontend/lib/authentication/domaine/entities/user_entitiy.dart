import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? userid;
  final String? fullname;
  final String email;
  final String password;

  const User({
    this.userid,
    this.fullname,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [userid, fullname, email, password];
}
