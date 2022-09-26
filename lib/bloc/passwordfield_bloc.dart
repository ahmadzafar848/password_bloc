import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'passwordfield_event.dart';
part 'passwordfield_state.dart';

class PasswordFieldBloc extends Bloc<PasswordFieldEvent, PasswordFieldState> {
  PasswordFieldBloc() : super(PasswordFieldInitialState()) {
    on<VisiblePasswordEvent>((event, emit) {
      emit.call(PasswordVisibleState(isObscureText: event.obscureText));
    });
  }
}
