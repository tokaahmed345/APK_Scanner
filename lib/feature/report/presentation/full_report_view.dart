import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/feature/apk_scanner/domain/entity/scan_entity.dart';
import 'package:apk_scanner/feature/report/presentation/widgets/full_report/full_report_view_body.dart';

import 'package:flutter/material.dart';

class FullReportView extends StatelessWidget {
  final ScanEntity scanData; 

  const FullReportView({super.key,required this.scanData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child:FullReportViewBody(scanData: scanData!),
      ),
    );
  }
}