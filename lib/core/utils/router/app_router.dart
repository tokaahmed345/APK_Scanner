import 'package:apk_scanner/core/utils/router/routes_name.dart';
import 'package:apk_scanner/feature/auth/presentation/login_view.dart';
import 'package:apk_scanner/feature/auth/presentation/widgets/sign_up/register_view_body.dart';
import 'package:apk_scanner/feature/auth/register_view.dart';
import 'package:apk_scanner/feature/splash/presentation/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final router = GoRouter(
    // redirect: (context, state) {
    //   final user = FirebaseAuth.instance.currentUser;

    //   // Logged in but not already on the tab container -> send there.
    //   if (user != null && state.name != RoutesName.mainNavigation) {
    //     return RoutesName.mainNavigation;
    //   }

    //   // Not logged in but trying to reach the tab container -> send to login.
    //   if (user == null && state.name == RoutesName.mainNavigation) {
    //     return RoutesName.logIn;
    //   }

    //   return null;
    // },
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
    ],
  );
}