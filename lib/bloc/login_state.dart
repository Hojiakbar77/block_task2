part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class CheckUserResult extends LoginState{
  final String? response;

  CheckUserResult({required this.response});
}
