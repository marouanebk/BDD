import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? userid;
  final String? fullname;
  final String email;
  final String? password;
  final String? biography;

  const User(
      {this.userid,
      this.fullname,
      required this.email,
      required this.password,
      this.biography});

  @override
  List<Object?> get props => [userid, fullname, email, password, biography];
}
