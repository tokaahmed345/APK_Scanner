import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class AppNameText extends StatelessWidget {
  const AppNameText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(text: 'APK', style: AppStyle.authLogo),
          TextSpan(
            text: 'SCAN',
            style: AppStyle.authLogo.copyWith(color: AppColors.whiteColor),
          ),
        ],
      ),
    );
  }
}