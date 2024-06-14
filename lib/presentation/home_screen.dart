import 'package:flutter/material.dart';
import 'package:myapp/feature/authentication.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authenticate = Authentication();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vision Assistance Application"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              await authenticate.signOut();
            },
            child: const Text(
              "Sign Out",
            ),
          ),
        ],
      ),
    );
  }
}
