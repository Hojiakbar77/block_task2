
// Update this import

import 'package:flutter_bloc/flutter_bloc.dart';

import '../server/register_net.dart';
part 'register_state.dart';
part 'register_event.dart';



class RegisterBloc extends Bloc<RegisterEvent, RegisterState> { // Swap the type arguments
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is CheckUserEventDetail) {
        print("Apiga jonatildi");
        String? result = await register(event.name, event.email, event.password);
        if (result != null) {
          emit(CheckUserResult(response: result)); // Use CheckUserResult here
        } else {
          emit(CheckUserResult(response: "ok")); // Use CheckUserResult here
        }
      }
    });
  }
}

