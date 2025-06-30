import 'package:bug_tracker_application/Features/Domain/services/authentication_service/login_authentcation.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial(email: '', password: '')) {
    on<RegisterEvent>((event, emit) async {
      await LoginAuthentcation().register(
        event.email,
        event.password,
        event.context,
      );
      emit(AuthState(email: event.email, password: event.password));
    });

    on<LoginEvent>((event, emit) async {
      await LoginAuthentcation().login(
        event.email,
        event.password,
        event.context,
      );
      emit(AuthState(email: event.email, password: event.password));
    });
  }
}
