import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_options.dart';
import './presentation/homescreen.dart';
import './feature/authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          
          if(snapshot.hasError) {
            return const Text("Something went wrong");
          }
          else if(snapshot.hasData) {
            return const HomeScreen();
          }
          else{
            return const SignInScreen();
          }    

        }
      ),
    );
  }
}



class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authentication = Authentication();
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
              await authentication.signInWithGoogle();
            },
            child: const Text("Sign In"),
          ),
        ],
      ),
    );
  }
}
