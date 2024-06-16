import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/firebase/authentication.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthInitial()) {
    on<GoogleSignInButtonPressed>(_googleAuthentication);
    on<SignnOutButtonPressed>(_signOut);
  }

  void _googleAuthentication(GoogleSignInButtonPressed event,
      Emitter<AuthenticationState> emit) async {
    emit(AuthLoading());

    try {
      final authentication = Authentication();
      await authentication.signInWithGoogle();
      if (await authentication.isAuthenticate()) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Something went wrong from developer"));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void _signOut(
      SignnOutButtonPressed event, Emitter<AuthenticationState> emit) async {
    emit(AuthLoading());
    try {
      final authentication = Authentication();
      authentication.signOut();
      if (await authentication.isAuthenticate()) {
        emit(AuthInitial());
      } else {
        emit(AuthFailure("Why it still have current user?"));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}
