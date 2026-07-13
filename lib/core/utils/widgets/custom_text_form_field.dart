import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final IconData? icon;
  final void Function()? onPressed;
  final IconData? suffixIcon;
  final bool
  obscure;
  final bool? enabled;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;
  final double? radius;

  const CustomFormField({
    super.key,
    required this.hint,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.icon,
    this.suffixIcon,
    this.obscure = false, 
    this.onPressed,
    this.enabled,
    this.fillColor,
    this.borderColor,
    this.hintStyle,
    this.contentPadding,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveBorderColor = borderColor ?? context.borderColor;

    return TextFormField(
      enabled: enabled,
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
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                color: context
                    .borderColor, 
                onPressed: onPressed,
              )
            : null,
        hintText: hint,
        hintStyle:
            hintStyle ??
            TextStyle(color: context.secondaryTextColor.withOpacity(0.5)),
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: context.borderColor,
              ) 
            : null,
        filled: true,
        fillColor: fillColor ?? context.surfaceColor, 
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            radius ?? 12,
          ), 
          borderSide: BorderSide(color: effectiveBorderColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 12),
          borderSide: BorderSide(color: effectiveBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 12),
          borderSide: BorderSide(color: effectiveBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 12),
          borderSide: BorderSide(
            color: context.primaryColor, 
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 12),
          borderSide: const BorderSide(color: AppColors.redColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? 12),
          borderSide: const BorderSide(color: AppColors.redColor, width: 1.2),
        ),
      ),
    );
  }
}
