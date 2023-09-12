part of 'register_bloc.dart';


abstract class RegisterEvent {}

class InitialRegisterBloc extends RegisterEvent{}

class CheckUserEventDetail extends RegisterEvent{
  final String name;
  final String email;
  final String password;

  CheckUserEventDetail({required this.name,required this.email, required this.password});
}
