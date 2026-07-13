
import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String initials;
  final String name;
  final String email;

  const ProfileHeader({
    super.key,
    required this.initials,
    required this.name,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withOpacity(0.15),
              border: Border.all(color: AppColors.primary, width: 1.5),
            ),
            alignment: Alignment.center,
            child: Text(
              initials,
              style: AppStyle.text20.copyWith(color: AppColors.primary),
            ),
          ),
          const SizedBox(height: 12),
          Text(name, style: AppStyle.text18),
          const SizedBox(height: 4),
          Text(email, style: AppStyle.authSmallText),
        ],
      ),
    );
  }
}