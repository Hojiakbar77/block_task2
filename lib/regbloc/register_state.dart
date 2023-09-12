part of 'register_bloc.dart';


abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class CheckUserResult extends RegisterState{
  final String response;

  CheckUserResult({required this.response});
}
