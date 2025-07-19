part of 'auth_bloc.dart';

/// ------------------------------
/// AuthEvent - Base Authentication Event
/// ------------------------------
///
/// Purpose:
/// Abstract base class for all authentication-related events
/// used in the Authentication BLoC.
///
/// Extend this class to define specific events like login, register, or logout.

/// ------------------------------

abstract class AuthEvent {}

/// RegisterEvent - Trigger User Registration
/// ------------------------------
///
/// Triggered when a user attempts to register.
///
/// Contains:
/// - [email/]: The user's email address.
/// - [password/]: The user's password.
/// - [context/]: BuildContext for showing messages or navigation.
/// -------------------------------------------------------------------------

class RegisterEvent extends AuthEvent {
  final String name;
  
  final String email;
  final String password;
  final BuildContext context;

  RegisterEvent(
    this.context,
  {required this.name,
    required this.email,
    required this.password,
  });
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;

  LoginEvent(this.context, {required this.email, required this.password});
}

/// LoginEvent - Trigger User Login
/// ------------------------------
///
/// Triggered when a user attempts to log in.
///
/// Contains:
/// - [email/]: The user's email address.
/// - [password/]: The user's password.
/// - [context/]: BuildContext for showing messages or navigation.
/// ------------------------------------------------------------------
class LogoutEvent extends AuthEvent {
  final BuildContext context;

  LogoutEvent(this.context);
}
/// ------------------------------
/// LogoutEvent - Trigger User Logout
/// ------------------------------
///
/// Triggered when a user attempts to log out.
///
/// Contains:
/// - [context]: BuildContext for showing messages or navigation.
/// --------------------------------------------------------------------