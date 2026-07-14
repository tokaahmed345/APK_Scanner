
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:flutter/material.dart';

class SeveritySectionHeader extends StatelessWidget {
  final String title;
  final int count;
  final Color color;

  const SeveritySectionHeader({
    super.key,
    required this.title,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        '$title ($count)',
        style: AppStyle.text16.copyWith(
          color: color,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
