
import 'package:equatable/equatable.dart';

abstract class UserBlocState extends Equatable {
  const UserBlocState();

  @override
  List<Object> get props => [];
}

class UserBlocStateInitial extends UserBlocState {}

class LodingUserBlocState extends UserBlocState {}

class ErrorUserBlocState extends UserBlocState {
  final String message;

  const ErrorUserBlocState({required this.message});
  @override
  List<Object> get props => [message];
}

class MessageUserBlocState extends UserBlocState {
  final String message;

  const MessageUserBlocState({required this.message});
  @override
  List<Object> get props => [message];
}

class AuthenticatedState extends UserBlocState {}

class UnAuthenticatedState extends UserBlocState {}

class SignOuState extends UserBlocState {}

class UserDetailsState extends UserBlocState {
  final String fullname;
  final String email;

  const UserDetailsState({required this.fullname , required this.email});
  @override
  List<Object> get props => [fullname , email];
}

