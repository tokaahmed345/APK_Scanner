import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/widgets/custom_elevated_button.dart';
import 'package:apk_scanner/feature/auth/presentation/widgets/sign_up/login_redirect_text.dart';
import 'package:apk_scanner/feature/auth/presentation/widgets/sign_up/register_form_field.dart';
import 'package:apk_scanner/feature/auth/presentation/widgets/sign_up/register_title_section.dart';
import 'package:flutter/material.dart';

import 'package:apk_scanner/core/utils/styles/app_style.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _onCreateAccountPressed() {
    if (_formKey.currentState!.validate()) {
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: AppColors.darkBackground,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                             Text('APK Scan', style: AppStyle.authLogo),
                const SizedBox(height: 24),
                const RegisterTitleSection(),
                const SizedBox(height: 24),
                RegisterFormFields(
                  nameController: _nameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                ),
                const SizedBox(height: 24),
                CustomElevatedButton(
                  text: 'CREATE ACCOUNT',
                  onPressed: _onCreateAccountPressed,
                  width: double.infinity,
                  height: 52,
                  radius: 12,
                  backgroundColor: AppColors.primary,
                  textStyle: AppStyle.authButtonText,
                ),
                const SizedBox(height: 16),
                const LoginRedirectText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}