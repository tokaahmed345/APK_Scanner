
import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class ReportAppBar extends StatelessWidget {
  final String apkName;
  final String scanDate;

  const ReportAppBar({
    super.key,
    required this.apkName,
    required this.scanDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(50),
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(Icons.arrow_back, color: AppColors.whiteColor),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'FULL REPORT',
              style: AppStyle.authSectionTitle.copyWith(
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            '$apkName · $scanDate',
            style: AppStyle.text18,
          ),
        ),
      ],
    );
  }
}
