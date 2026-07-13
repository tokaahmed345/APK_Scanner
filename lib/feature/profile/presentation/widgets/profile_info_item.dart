
import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class ProfileInfoItem {
  final String label;
  final String value;
  final Color? valueColor;

  const ProfileInfoItem({
    required this.label,
    required this.value,
    this.valueColor,
  });
}

class ProfileInfoCard extends StatelessWidget {
  final List<ProfileInfoItem> items;

  const ProfileInfoCard({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkBorder.withOpacity(.7),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: context.borderColor.withOpacity(0.15)),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          final item = items[index];
          final isLast = index == items.length - 1;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              border: isLast
                  ? null
                  : Border(
                      bottom: BorderSide(
                        color: context.borderColor.withOpacity(0.12),
                      ),
                    ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.label,
                  style: AppStyle.authSmallText.copyWith(
                    color: AppColors.primary.withOpacity(0.6),
                  ),
                ),
                Text(
                  item.value,
                  style: AppStyle.text16.copyWith(
                    fontSize: 14,
                    color: item.valueColor ?? context.primaryTextColor,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
