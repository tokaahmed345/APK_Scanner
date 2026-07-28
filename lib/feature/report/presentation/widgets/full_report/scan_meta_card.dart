import 'package:flutter/material.dart';
import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:apk_scanner/feature/apk_scanner/domain/entity/scan_entity.dart';

class ScanMetadataCard extends StatelessWidget {
  final ScanEntity scanData;

  const ScanMetadataCard({super.key, required this.scanData});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SCAN METADATA',
            style: AppStyle.authSectionTitle,
          ),
          const SizedBox(height: 14),
          _MetadataRow(label: 'Package Name', value: scanData.packageName),
          _MetadataRow(
            label: 'Version', 
            value: '${scanData.versionName} (Build ${scanData.versionCode})',
          ),
          _MetadataRow(label: 'Target SDK', value: scanData.targetSdk),
          _MetadataRow(label: 'Min SDK', value: scanData.minSdk, isLast: true),
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
      padding: EdgeInsets.only(bottom: isLast ? 0 : 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: AppColors.greyColor, fontSize: 13),
          ),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.whiteColor,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}