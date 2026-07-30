import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/constant/app_constant.dart';
import 'package:apk_scanner/core/utils/router/routes_name.dart';
import 'package:apk_scanner/core/utils/service_locator/service_locator.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:apk_scanner/core/utils/widgets/custom_elevated_button.dart';
import 'package:apk_scanner/feature/profile/presentation/widgets/profile_header.dart';
import 'package:apk_scanner/feature/profile/presentation/widgets/profile_info_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

final currentUser = getIt.get<FirebaseAuth>().currentUser;

final String name = currentUser?.displayName ?? 'User';

final String email = currentUser?.email ?? 'No Email';

final String initials = AppConstant.getInitials(
  currentUser?.displayName,
  email,
);

class _ProfileViewBodyState extends State<ProfileViewBody> {
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

          ProfileHeader(initials: initials, name: name, email: email),
          const SizedBox(height: 24),

          const ProfileInfoCard(
            items: [
              ProfileInfoItem(label: 'App Version', value: '1.0.0'),
              ProfileInfoItem(label: 'Scanner Engine', value: 'Active'),
              ProfileInfoItem(
                label: 'Status',
                value: 'Protected',
                valueColor: AppColors.primary,
              ),
            ],
          ),
          const SizedBox(height: 32),
          const ProfileInfoCard(
            items: [
              ProfileInfoItem(
                label: 'App Purpose',
                value: 'APK Vulnerability Scanner',
              ),
              ProfileInfoItem(
                label: 'Privacy Policy',
                value: 'Secured & Private',
              ),
              ProfileInfoItem(
                label: 'Support Contact',
                value: 'support@apkscanner.io',
                valueColor: AppColors.primary,
              ),
            ],
          ),
          const SizedBox(height: 32),

          CustomElevatedButton(
            text: 'Sign Out',
            width: double.infinity,
            backgroundColor: AppColors.redColor.withOpacity(0.1),
            foregroundColor: Colors.redAccent,
            radius: 14,
            elevation: 0,
            textStyle: AppStyle.text16.copyWith(
              color: AppColors.redColor,
              fontSize: 14,
            ),
            onPressed: () async {
              await getIt.get<FirebaseAuth>().signOut();
              if (context.mounted) {
                GoRouter.of(context).push(RoutesName.login);
              }
            },
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
