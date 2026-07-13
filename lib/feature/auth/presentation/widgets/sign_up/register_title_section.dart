import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class RegisterTitleSection extends StatelessWidget {
  const RegisterTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Create account', style: AppStyle.authTitle),
        const SizedBox(height: 6),
        Text(
          'Join the security research platform',
          style: AppStyle.authSubtitle,
        ),
      ],
    );
  }
}