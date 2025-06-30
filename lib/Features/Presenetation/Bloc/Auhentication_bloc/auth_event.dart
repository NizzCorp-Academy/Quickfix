part of 'auth_bloc.dart';

abstract class AuthEvent {}

class RegisterEvent extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;

  RegisterEvent(this.context, {required this.email, required this.password});
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  final BuildContext context;

  LoginEvent(this.context, {required this.email, required this.password});
}

class LogoutEvent extends AuthEvent {
  final BuildContext context;

  LogoutEvent(this.context);
}
