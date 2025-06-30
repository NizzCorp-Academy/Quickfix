part of 'auth_bloc.dart';

class AuthState {
  String email;
  String password;

  AuthState({required this.email, required this.password});
}

final class AuthInitial extends AuthState {
  AuthInitial({required super.email, required super.password});
}

// class Register extends AuthState {
//   Register({required super.email, required super.password});
// }
// // class AuthLoading extends AuthState {}

// // class AuthSuccess extends AuthState {
// //   final String uid;

// //   AuthSuccess({required this.uid});
// // }

// // class AuthFailure extends AuthState {
// //   final String message;

// //   AuthFailure({required this.message});
// // }
