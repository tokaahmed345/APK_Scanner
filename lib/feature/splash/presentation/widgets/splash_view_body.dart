import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:apk_scanner/feature/splash/presentation/widgets/animated_logo.dart';
import 'package:apk_scanner/feature/splash/presentation/widgets/app_name_text.dart';
import 'package:flutter/material.dart';


class SplashViewBody extends StatelessWidget {
  final AnimationController waveController;

  const SplashViewBody({super.key, required this.waveController});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.darkBackground,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedLogo(waveController: waveController),
            const SizedBox(height: 20),
            const AppNameText(),
            const SizedBox(height: 8),
            Text(
              'APK SECURITY ANALYZER',
              style: AppStyle.authSectionTitle,
            ),
          ],
        ),
      ),
    );
  }
}