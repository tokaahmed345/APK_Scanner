
import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class ScanMetadataCard extends StatelessWidget {
  const ScanMetadataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.darkBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SCAN METADATA',
            style: AppStyle.authSectionTitle,
          ),
          const SizedBox(height: 14),
          const _MetadataRow(label: 'Package', value: 'com.banking.myapp'),
          const _MetadataRow(label: 'Version', value: '2.3.1 (build 231)'),
          const _MetadataRow(label: 'Target SDK', value: '33 (Android 13)'),
          const _MetadataRow(label: 'Min SDK', value: '16 (Android 4.1)'),
          const _MetadataRow(label: 'File Size', value: '18.4 MB'),
          const _MetadataRow(
            label: 'SHA-256',
            value: 'a3f9c2...d84e1b',
            isLast: true,
          ),
        ],
      ),
    );
  }
}

class _MetadataRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isLast;

  const _MetadataRow({
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppStyle.text16.copyWith(
              color: AppColors.textHint,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            value,
            style: AppStyle.text16,
          ),
        ],
      ),
    );
  }
}