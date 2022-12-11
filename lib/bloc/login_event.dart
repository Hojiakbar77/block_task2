part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class InitialLoginBloc extends LoginEvent{}

class CheckUserEvent extends LoginEvent{
  final String email;
  final String password;

  CheckUserEvent({required this.email, required this.password});
}
