import 'package:apk_scanner/core/utils/router/routes_name.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginRedirectText extends StatelessWidget {
  const LoginRedirectText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>context.push(RoutesName.login),
      child: Center(
        child: RichText(
          text: TextSpan(
            style: AppStyle.authSmallText,
            children: [
              const TextSpan(text: 'Already have an account? '),
              TextSpan(text: 'Login', style: AppStyle.authLinkText),
            ],
          ),
        ),
      ),
    );
  }
}