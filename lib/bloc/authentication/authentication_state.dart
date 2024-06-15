part of 'authentication_bloc.dart';

sealed class AuthenticationState {}

final class AuthInitial extends AuthenticationState {}

final class AuthLoading extends AuthenticationState {}

final class AuthSuccess extends AuthenticationState {}

final class AuthFailure extends AuthenticationState {
  final String message;
  AuthFailure(this.message);
}
