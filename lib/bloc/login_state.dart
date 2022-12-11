part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class CheckUserResult extends LoginState{
  final String token;

  CheckUserResult({required this.token});
}
