import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:apk_scanner/feature/apk_scanner/presentation/widgets/analysis_log_card.dart';
import 'package:apk_scanner/feature/apk_scanner/presentation/widgets/scan_icon_section.dart';
import 'package:apk_scanner/feature/apk_scanner/presentation/widgets/scan_progress_section.dart';
import 'package:flutter/material.dart';

class ApkScannerViewBody extends StatelessWidget {
  const ApkScannerViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        children: [
          const SizedBox(height: 30),

          const ScanIconSection(),
          const SizedBox(height: 20),

          Text('Scanning APK', style: AppStyle.text20),
          const SizedBox(height: 6),

          Text('com.banking.myapp.v2.3.1.apk', style: AppStyle.authFieldHint),
          const SizedBox(height: 30),

          const ScanProgressSection(),
          const SizedBox(height: 24),

          const AnalysisLogCard(),
        ],
      ),
    );
  }
}
