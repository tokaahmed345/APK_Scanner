import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:apk_scanner/feature/apk_scanner/presentation/widgets/analysis_log_row.dart';
import 'package:flutter/material.dart';

class AnalysisLogCard extends StatelessWidget {
  const AnalysisLogCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget checkIcon = const Icon(
      Icons.check_circle,
      color: AppColors.primary,
      size: 18,
    );

    final Widget loadingIcon = const SizedBox(
      width: 16,
      height: 16,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
      ),
    );

    final Widget pendingIcon = Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        color: AppColors.greyColor,
        shape: BoxShape.circle,
      ),
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.darkBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('ANALYSIS LOG', style: AppStyle.authSectionTitle),
          const SizedBox(height: 12),

          AnalysisLogRow(
            icon: checkIcon,
            text: 'Extracting APK archive',
            textColor: AppColors.primary,
          ),
          AnalysisLogRow(
            icon: checkIcon,
            text: 'Parsing AndroidManifest.xml',
            textColor: AppColors.primary,
          ),
          AnalysisLogRow(
            icon: checkIcon,
            text: 'Analyzing declared permissions',
            textColor: AppColors.primary,
          ),
          AnalysisLogRow(
            icon: checkIcon,
            text: 'Decompiling DEX bytecode',
            textColor: AppColors.primary,
          ),
          AnalysisLogRow(
            icon: checkIcon,
            text: 'Detecting hardcoded secrets',
            textColor: AppColors.primary,
          ),
          AnalysisLogRow(
            icon: checkIcon,
            text: 'Scanning HTTP endpoints',
            textColor: AppColors.primary,
          ),

          AnalysisLogRow(
            icon: loadingIcon,
            text: 'Checking cryptography usage',
            textColor: AppColors.whiteColor,
          ),

          AnalysisLogRow(
            icon: pendingIcon,
            text: 'Auditing data storage',
            textColor: AppColors.textHint,
          ),
          AnalysisLogRow(
            icon: pendingIcon,
            text: 'Reviewing exported components',
            textColor: AppColors.textHint,
          ),
          AnalysisLogRow(
            icon: pendingIcon,
            text: 'Generating vulnerability report',
            textColor: AppColors.textHint,
          ),
        ],
      ),
    );
  }
}
