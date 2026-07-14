import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/feature/auth/presentation/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(child: LoginViewBody()),
    );
  }
}
