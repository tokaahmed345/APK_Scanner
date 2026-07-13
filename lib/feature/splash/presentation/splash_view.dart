import 'dart:async';
import 'package:apk_scanner/core/utils/router/routes_name.dart';
import 'package:apk_scanner/feature/splash/presentation/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _waveController;
  Timer? _navTimer;

  @override
  void initState() {
    super.initState();

    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _navTimer = Timer(const Duration(seconds: 5), _navigateToLogin);
  }

  void _navigateToLogin() {
    if (!mounted) return;
    context.go(RoutesName.login);
  }

  @override
  void dispose() {
    _navTimer?.cancel();
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody(waveController: _waveController));
  }
}
