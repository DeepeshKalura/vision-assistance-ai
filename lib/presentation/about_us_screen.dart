import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/app_url.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: Column(
        children: [
          const Center(
            child: Text("About Us"),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.pushReplacementNamed(
                  AppUrl.signInScreen,
                );
              },
              child: const Text("Let Sign in"),
            ),
          ),
        ],
      ),
    );
  }
}
