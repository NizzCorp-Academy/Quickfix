part of 'auth_bloc.dart';



// AuthState - Base State Class
/// ------------------------------
///
/// Purpose:
/// Represents the state of authentication forms (e.g., Login/Register).
/// Holds the current [email/] and [password/] entered by the user.
///
/// This class is typically used with BLoC or Cubit for managing authentication form state.

class AuthState {
  String email;
  String password;

  AuthState({required this.email, required this.password});
}

final class AuthInitial extends AuthState {
  AuthInitial({required super.email, required super.password});
}
