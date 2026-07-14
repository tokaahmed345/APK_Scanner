import 'package:flutter/material.dart';
import '../colors/app_colors.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.hint,
    this.obscure = false,
    required this.icon,
    this.suffixIcon,
    this.onPressed,
    this.keyboardType,
    this.validator,
    this.fillColor = const Color(0xFF151515),
    this.borderColor = const Color(0xFF222222),
    this.textColor = Colors.white, // اللون الافتراضي للنص داخل الحقل
  });

  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final IconData icon;
  final IconData? suffixIcon;
  final VoidCallback? onPressed;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Color fillColor;
  final Color borderColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      validator: validator,
      cursorColor: context.primaryColor,
      style: TextStyle(
        fontSize: 15,
        color: context.primaryTextColor, 
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: fillColor,
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textHint, fontSize: 14),
        prefixIcon: Icon(icon, color: AppColors.textHint, size: 20),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon, color: AppColors.textHint, size: 20),
                onPressed: onPressed,
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
        ),
      ),
    );
  }
}
