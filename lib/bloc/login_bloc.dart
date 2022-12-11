

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

import '../server/net.dart';


part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is CheckUserEvent) {
          print("Apiga jonatildi");
          String result = await login(event.email,event.password);
          emit(CheckUserResult(token: result));
        }
      }
    );
  }
}

