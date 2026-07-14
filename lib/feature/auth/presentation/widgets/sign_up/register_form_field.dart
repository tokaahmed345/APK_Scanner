import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/function/validators.dart';
import 'package:apk_scanner/core/utils/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class RegisterFormFields extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const RegisterFormFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  State<RegisterFormFields> createState() => _RegisterFormFieldsState();
}

class _RegisterFormFieldsState extends State<RegisterFormFields> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('FULL NAME'),
        const SizedBox(height: 8),
        CustomFormField(
          fillColor: AppColors.fillColor,
          controller: widget.nameController,
          hint: 'Alex Johnson',

          icon: Icons.person_outline,
          keyboardType: TextInputType.name,
          validator: Validators.nameValidator,
        ),
        const SizedBox(height: 16),

        const Text('EMAIL'),
        const SizedBox(height: 8),
        CustomFormField(
          fillColor: AppColors.fillColor,
          controller: widget.emailController,
          hint: 'alex@security.io',
          icon: Icons.mail_outline,
          keyboardType: TextInputType.emailAddress,
          validator: Validators.emailValidator,
        ),
        const SizedBox(height: 16),

        const Text('PASSWORD'),
        const SizedBox(height: 8),
        CustomFormField(
          fillColor: AppColors.fillColor,

          controller: widget.passwordController,
          hint: 'Min.8 characters',
          icon: Icons.lock_outline,
          obscure: _obscurePassword,
          suffixIcon: _obscurePassword
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          onPressed: _togglePasswordVisibility,
          validator: Validators.passwordValidator,
        ),
        const SizedBox(height: 16),

        const Text('CONFIRM PASSWORD'),
        const SizedBox(height: 8),
        CustomFormField(
          fillColor: AppColors.fillColor,
          controller: widget.confirmPasswordController,
          hint: 'Repeat password',
          icon: Icons.lock_outline,

          obscure: _obscureConfirmPassword,
          suffixIcon: _obscureConfirmPassword
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          onPressed: _toggleConfirmPasswordVisibility,
          validator: (value) => Validators.confirmPasswordValidator(
            value,
            widget.passwordController.text,
          ),
        ),
      ],
    );
  }
}
