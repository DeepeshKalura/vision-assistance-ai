import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final authentication = Authentication();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SignIn Application",
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              // await authentication.signInWithGoogle();
            },
            child: const Text("Sign In"),
          ),
        ],
      ),
    );
  }
}
