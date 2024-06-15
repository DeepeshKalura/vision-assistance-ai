import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/about_us_screen.dart';
import '../presentation/signin_screen.dart';
import '/core/app_url.dart';
import '../presentation/splash_screen.dart';
import '../presentation/home_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static final router = GoRouter(
    initialLocation: '/',
    navigatorKey: rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        name: AppUrl.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/homescreen',
        name: AppUrl.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/signin',
        name: AppUrl.signInScreen,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/aboutus',
        name: AppUrl.aboutUsScreen,
        builder: (context, state) => const AboutUsScreen(),
      ),
    ],
  );
}
