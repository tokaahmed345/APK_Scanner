import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:apk_scanner/core/utils/widgets/custom_elevated_button.dart';
import 'package:apk_scanner/feature/profile/presentation/widgets/profile_header.dart';
import 'package:apk_scanner/feature/profile/presentation/widgets/profile_info_item.dart';
import 'package:apk_scanner/feature/profile/presentation/widgets/profile_state_card.dart';

import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            'ACCOUNT',
            style: AppStyle.authSectionTitle.copyWith(color: AppColors.primary),
          ),
          const SizedBox(height: 6),
          Text('Profile', style: AppStyle.text28),
          const SizedBox(height: 12),
          Divider(color: context.borderColor.withOpacity(0.2)),
          const SizedBox(height: 20),

          const ProfileHeader(
            initials: 'AJ',
            name: 'Alex Johnson',
            email: 'alex@security.io',
          ),
          const SizedBox(height: 24),

          const ProfileStatsCard(
            totalScans: 47,
            criticalFound: 23,
            appsSecured: 12,
          ),
          const SizedBox(height: 20),

          const ProfileInfoCard(
            items: [
              ProfileInfoItem(label: 'Membership', value: 'Pro Plan'),
              ProfileInfoItem(label: 'Member since', value: 'Jan 2025'),
              ProfileInfoItem(label: 'Last scan', value: '2026-07-13'),
              ProfileInfoItem(
                label: 'API Quota',
                value: '850 / 1000',
                valueColor: AppColors.primary,
              ),
            ],
          ),
          const SizedBox(height: 24),

CustomElevatedButton(
      text: 'Sign Out',
      width: double.infinity,
      backgroundColor: AppColors.redColor.withOpacity(0.1),
      foregroundColor: Colors.redAccent,
      radius: 14,
      elevation: 0,
      textStyle: AppStyle.text16.copyWith(
        color: Colors.redAccent,
        fontSize: 14,
      ),
      onPressed:   () {},
    ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}



