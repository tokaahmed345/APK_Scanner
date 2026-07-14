import 'package:apk_scanner/core/utils/router/routes_name.dart';
import 'package:apk_scanner/core/utils/widgets/main_navigation_bottom.dart';
import 'package:apk_scanner/feature/auth/presentation/login_view.dart';
import 'package:apk_scanner/feature/auth/register_view.dart';
import 'package:apk_scanner/feature/home/presentation/home_view.dart';
import 'package:apk_scanner/feature/splash/presentation/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: RoutesName.splash,
        name: RoutesName.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: RoutesName.login,
        name: RoutesName.login,
        builder: (context, state) => LoginView(),
      ),
       GoRoute(
        path: RoutesName.signUp,
        name: RoutesName.signUp,
        builder: (context, state) => RegisterView(),
      ),
        GoRoute(
        path: RoutesName.mainNavigation,
        name: RoutesName.mainNavigation,
        builder: (context, state) => MainNavigationScreen(),
      ),
             
    ],
  );
}
