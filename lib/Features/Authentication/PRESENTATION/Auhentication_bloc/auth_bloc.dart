import 'package:bug_tracker_application/Features/Authentication/DATA/Repositories/login_authentcation.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// ------------------------------
/// AuthBloc - Authentication Business Logic Component
/// ------------------------------
///
/// Purpose:
/// Handles authentication events such as user registration and login,
/// and manages the corresponding authentication state.
///
/// Uses `LoginAuthentcation` service to perform Firebase operations.
///
/// Emits:
/// - [AuthState/] with updated email and password after successful registration or login.
///
/// Events Handled:
/// - [RegisterEvent/]
/// - [LoginEvent/]
/// -------------------------------------------------------------------------------------------
/// Initializes the [AuthBloc/] with [AuthInitial/] state.
///
/// Registers event handlers for:
/// - [RegisterEvent/]: Handles user registration.
/// - [LoginEven/t]: Handles user login.
/// -----------------------------------------------------------
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial(email: '', password: '')) {
    on<RegisterEvent>((event, emit) async {
      await LoginAuthentcation().register(
        event.name,
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
