import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class ScanIconSection extends StatelessWidget {
  const ScanIconSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.5),
          width: 1.2,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.crop_free_rounded,
          color: AppColors.primary,
          size: 30,
        ),
      ),
    );
  }
}