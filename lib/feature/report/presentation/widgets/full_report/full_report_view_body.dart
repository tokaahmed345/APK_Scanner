import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/feature/report/presentation/widgets/full_report/full_report_app_bar.dart';
import 'package:apk_scanner/feature/report/presentation/widgets/full_report/report_bottom_action.dart';
import 'package:apk_scanner/feature/report/presentation/widgets/full_report/scan_meta_card.dart';
import 'package:apk_scanner/feature/report/presentation/widgets/full_report/severity_section_header.dart';
import 'package:apk_scanner/feature/report/presentation/widgets/full_report/vulnerability_card.dart';
import 'package:flutter/material.dart';

class FullReportViewBody extends StatefulWidget {
  const FullReportViewBody({super.key});

  @override
  State<FullReportViewBody> createState() => _FullReportViewBodyState();
}

class _FullReportViewBodyState extends State<FullReportViewBody> {
  final ScrollController _scrollController = ScrollController();

  static const List<VulnerabilityCard> _vulnerabilities = [
    VulnerabilityCard(
      number: '01',
      title: 'Hardcoded API Secret Key',
      description:
          'A plaintext API secret was found embedded in the application binary. Attackers can extract and abuse this credential to access backend services.',
      filePath: 'com/banking/myapp/network/ApiClient.java',
    ),
    VulnerabilityCard(
      number: '02',
      title: 'Insecure Data Storage - SQLite',
      description:
          'Sensitive user data is stored in an unencrypted local SQLite database, making it accessible to attackers with device access.',
      filePath: 'com/banking/myapp/data/LocalDatabase.java',
    ),
    VulnerabilityCard(
      number: '03',
      title: 'Weak Cryptography Implementation',
      description:
          'The app uses a deprecated encryption algorithm (DES) which is considered insecure by modern standards.',
      filePath: 'com/banking/myapp/security/CryptoUtils.java',
    ),
    VulnerabilityCard(
      number: '04',
      title: 'Exported Activity Without Permission',
      description:
          'An activity is exported without required permission checks, allowing other apps to launch it directly.',
      filePath: 'com/banking/myapp/AndroidManifest.xml',
    ),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const ReportAppBar(
            apkName: 'com.banking.myapp',
            scanDate: '2026-07-13',
          ),
          const SizedBox(height: 18),
          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              trackVisibility: true,
              thickness: 6,
              radius: const Radius.circular(10),
              child: CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const SliverToBoxAdapter(child: ScanMetadataCard()),
                  const SliverToBoxAdapter(
                    child: SeveritySectionHeader(
                      title: 'CRITICAL',
                      count: 4,
                      color: AppColors.redColor,
                    ),
                  ),
                  SliverList.builder(
                    itemCount: _vulnerabilities.length,
                    itemBuilder: (context, index) => _vulnerabilities[index],
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 8)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, top: 8),
            child: ReportBottomActions(onExportPdf: () {}, onShare: () {}),
          ),
        ],
      ),
    );
  }
}
