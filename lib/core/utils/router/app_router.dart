import 'package:apk_scanner/core/utils/router/routes_name.dart';
import 'package:apk_scanner/feature/auth/presentation/login_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RoutesName.login,
    routes: [
      GoRoute(
        path: RoutesName.splash,
        name: RoutesName.splash,
        builder: (context, state) => const SizedBox(),
      ),
      GoRoute(
        path: RoutesName.login,
        name: RoutesName.login,
        builder: (context, state) => const LoginView(),
      ),
    ],
  );
}
