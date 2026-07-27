import 'package:apk_scanner/core/utils/router/routes_name.dart';
import 'package:apk_scanner/core/utils/service_locator/service_locator.dart';
import 'package:apk_scanner/core/utils/widgets/main_navigation_bottom.dart';
import 'package:apk_scanner/feature/auth/presentation/login_view.dart';
import 'package:apk_scanner/feature/auth/register_view.dart';
import 'package:apk_scanner/feature/splash/presentation/splash_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    redirect: (context, state) {
      final user = getIt.get<FirebaseAuth>().currentUser;

      if (user != null && state.name != RoutesName.mainNavigation) {
        return RoutesName.mainNavigation;
      }

      if (user == null && state.name == RoutesName.mainNavigation) {
        return RoutesName.login;
      }

      return null;
    },
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
