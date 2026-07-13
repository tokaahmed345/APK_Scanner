
import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class ProfileStatsCard extends StatelessWidget {
  final int totalScans;
  final int criticalFound;
  final int appsSecured;

  const ProfileStatsCard({
    super.key,
    required this.totalScans,
    required this.criticalFound,
    required this.appsSecured,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.darkBorder.withOpacity(.7),

        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.borderColor.withOpacity(0.15)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _StatItem(value: totalScans.toString(), label: 'Total Scans'),
          _StatItem(value: criticalFound.toString(), label: 'Critical\nFound'),
          _StatItem(value: appsSecured.toString(), label: 'Apps Secured'),
        ],
      ),
    );
  }
}


class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: AppStyle.text20),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: AppStyle.authSmallText.copyWith(fontSize: 11),
        ),
      ],
    );
  }
}