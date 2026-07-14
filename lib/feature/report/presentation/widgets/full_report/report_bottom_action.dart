
import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:apk_scanner/core/utils/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ReportBottomActions extends StatelessWidget {
  final VoidCallback onExportPdf;
  final VoidCallback onShare;

  const ReportBottomActions({
    super.key,
    required this.onExportPdf,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: CustomElevatedButton(
            text: 'Export PDF',
            onPressed: onExportPdf,
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.blackColor,
            textStyle: AppStyle.authButtonText,
            height: 50,
            radius: 14,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: CustomElevatedButton(
            text: '⇪  Share',
            onPressed: onShare,
            backgroundColor: AppColors.darkSurface,
            foregroundColor: AppColors.whiteColor,
            textStyle: AppStyle.text16,
            height: 50,
            radius: 14,
          ),
        ),
      ],
    );
  }
}