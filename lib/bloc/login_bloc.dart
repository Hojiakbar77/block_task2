

import 'package:bloc/bloc.dart';
import 'package:block_task2/utils/const.dart';
import 'package:meta/meta.dart';

import '../server/net.dart';


part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      if (event is CheckUserEvent) {
          print("Apiga jonatildi");
        if (event.username == MyConst.userName &&
            event.password == MyConst.password) {
          print("Apiga jonatildi");
          var result = await getResult();
          emit(CheckUserResult(statusCode: result));
        } else {
          print("Apiga jonatilmadi");
          emit(CheckUserResult(statusCode: 403));
        }
      }
    });
  }
}

