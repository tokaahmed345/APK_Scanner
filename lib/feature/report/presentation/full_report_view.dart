import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/feature/report/presentation/widgets/full_report/full_report_view_body.dart';

import 'package:flutter/material.dart';

class FullReportView extends StatelessWidget {
  const FullReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(child: FullReportViewBody()),
    );
  }
}
