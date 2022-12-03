part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class InitialLoginBloc extends LoginEvent{}

class CheckUserEvent extends LoginEvent{
  final String username;
  final String password;

  CheckUserEvent({required this.username, required this.password});
}
