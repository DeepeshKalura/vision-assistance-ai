import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/app_routes.dart';

import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/bloc_observation.dart';
import 'firebase_options.dart';

Future<void> main() async {
  Bloc.observer = BlocObservationLogger();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
