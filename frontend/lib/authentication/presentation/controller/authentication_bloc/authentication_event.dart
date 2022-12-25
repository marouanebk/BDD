import 'package:equatable/equatable.dart';
import 'package:frontend/authentication/domaine/entities/user_entitiy.dart';

abstract class UserBlocEvent extends Equatable {
  const UserBlocEvent();

  @override
  List<Object> get props => [];
}

class CreateUserEvent extends UserBlocEvent {
  final User user;

  const CreateUserEvent({required this.user});

  @override
  List<Object> get props => [user];
}

class LogOutUserEvent extends UserBlocEvent {
  const LogOutUserEvent();

  @override
  List<Object> get props => [];
}

class ChooseTypeEvent extends UserBlocEvent {
  final int number;
  const ChooseTypeEvent({required this.number});

  @override
  List<Object> get props => [number];
}

class LoginuserEvent extends UserBlocEvent {
  final User user;

  const LoginuserEvent({required this.user});

  @override
  List<Object> get props => [user];
}
