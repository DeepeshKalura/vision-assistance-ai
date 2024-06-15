part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class GoogleSignInButtonPressed extends AuthenticationEvent {}

final class SignnOutButtonPressed extends AuthenticationEvent {}
