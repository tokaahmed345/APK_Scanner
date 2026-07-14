import 'package:apk_scanner/core/utils/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/colors/app_colors.dart';
import '../../../../core/utils/widgets/custom_text_form_field.dart';

class ForgotPasswordViewBody extends StatefulWidget {
  const ForgotPasswordViewBody({super.key});

  @override
  State<ForgotPasswordViewBody> createState() => _ForgotPasswordViewBodyState();
}

class _ForgotPasswordViewBodyState extends State<ForgotPasswordViewBody> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // ===== BACK BUTTON =====
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: AppColors.textHint,
              size: 20,
            ),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(height: 30),

          // ===== LOGO ROW =====
          const Row(
            children: [
              Icon(Icons.shield_outlined, color: AppColors.primary, size: 28),
              SizedBox(width: 8),
              Text(
                'APKSCAN',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),

          // ===== TITLE & SUBTITLE =====
          const Text(
            'Forgot Password?',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Enter your registered email address to receive a password reset link.',
            style: TextStyle(
              color: Color.fromARGB(255, 250, 248, 248),
              fontSize: 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 40),

          // ===== EMAIL FIELD =====
          const Text(
            'EMAIL',
            style: TextStyle(
              color: AppColors.textHint,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
            ),
          ),
          const SizedBox(height: 8),
          CustomFormField(
            controller: _emailController,
            hint: 'researcher@sec.io',
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            fillColor: const Color(0xFF151515),
            borderColor: const Color(0xFF222222),
          ),
          const SizedBox(height: 40),

          // ===== RESET BUTTON =====
          CustomElevatedButton(
            text: 'SEND RESET LINK',
            width: double.infinity,
            height: 56,
            radius: 12,
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.5,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
