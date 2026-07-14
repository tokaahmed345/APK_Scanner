import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/widgets/custom_elevated_button.dart';
import 'package:apk_scanner/core/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import '../forgot_password_view.dart';
import '../../../home/presentation/home_view.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),

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

            // ===== WELCOME TEXT =====
            const Text(
              'Welcome back',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Sign in to your security dashboard',
              style: TextStyle(color: AppColors.textHint, fontSize: 14),
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
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter your email';
                }
                final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                if (!emailRegExp.hasMatch(value)) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            const SizedBox(height: 24),

            // ===== PASSWORD FIELD =====
            const Text(
              'PASSWORD',
              style: TextStyle(
                color: AppColors.textHint,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 8),
            CustomFormField(
              controller: _passwordController,
              hint: '••••••••••••',
              obscure: _isObscure,
              icon: Icons.lock_outline,
              fillColor: const Color(0xFF151515),
              borderColor: const Color(0xFF222222),
              suffixIcon: _isObscure
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),

            // ===== FORGOT PASSWORD =====
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordView(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(0, 0),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(color: AppColors.textHint, fontSize: 13),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ===== LOGIN BUTTON =====
            CustomElevatedButton(
              text: 'LOGIN',
              width: double.infinity,
              height: 56,
              radius: 12,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeView()),
                  );
                }
              },
            ),
            const SizedBox(height: 24),

            // ===== SIGN UP FOOTER =====
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account? ",
                  style: TextStyle(color: AppColors.textHint, fontSize: 14),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
