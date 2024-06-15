import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/authentication/authentication_bloc.dart';
import '../core/app_url.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SignIn Application",
        ),
      ),
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
        if (state is AuthSuccess) {
          context.pushReplacementNamed(AppUrl.homeScreen);
        }
      }, builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AuthFailure) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  context.read<AuthenticationBloc>().add(
                        GoogleSignInButtonPressed(),
                      );
                },
                child: const Text("Sign In"),
              ),
            ],
          );
        }
      }),
    );
  }
}
