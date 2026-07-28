import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/service/report_helper_service.dart';
import 'package:apk_scanner/feature/apk_scanner/domain/entity/scan_entity.dart';
import 'package:apk_scanner/feature/report/presentation/widgets/full_report/full_report_app_bar.dart';
import 'package:apk_scanner/feature/report/presentation/widgets/full_report/report_bottom_action.dart';
import 'package:apk_scanner/feature/report/presentation/widgets/full_report/scan_meta_card.dart';
import 'package:apk_scanner/feature/report/presentation/widgets/full_report/severity_section_header.dart';
import 'package:apk_scanner/feature/report/presentation/widgets/full_report/vulnerability_card.dart';
import 'package:flutter/material.dart';

class FullReportViewBody extends StatefulWidget {
  final ScanEntity scanData;

  const FullReportViewBody({super.key, required this.scanData});

  @override
  State<FullReportViewBody> createState() => _FullReportViewBodyState();
}

class _FullReportViewBodyState extends State<FullReportViewBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scan = widget.scanData;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),

          ReportAppBar(
            apkName: scan.appName.isNotEmpty ? scan.appName : scan.packageName,
            scanDate: scan.scanDate,
          ),

          const SizedBox(height: 16),

          Expanded(
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              thickness: 5,
              radius: const Radius.circular(10),
              child: CustomScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(child: ScanMetadataCard(scanData: scan)),

                  const SliverToBoxAdapter(child: SizedBox(height: 16)),

                  if (scan.critical.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: SeveritySectionHeader(
                        title: 'CRITICAL SEVERITY',
                        count: scan.critical.length,
                        color: AppColors.redColor,
                      ),
                    ),
                    SliverList.builder(
                      itemCount: scan.critical.length,
                      itemBuilder: (context, index) {
                        final item = scan.critical[index];
                        return VulnerabilityCard(
                          number: (index + 1).toString().padLeft(2, '0'),
                          title: item.category,
                          description: item.detail,
                          severityColor: AppColors.redColor,
                        );
                      },
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 12)),
                  ],

                  if (scan.medium.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: SeveritySectionHeader(
                        title: 'MEDIUM SEVERITY',
                        count: scan.medium.length,
                        color: AppColors.orange,
                      ),
                    ),
                    SliverList.builder(
                      itemCount: scan.medium.length,
                      itemBuilder: (context, index) {
                        final item = scan.medium[index];
                        return VulnerabilityCard(
                          number: (index + 1).toString().padLeft(2, '0'),
                          title: item.category,
                          description: item.detail,
                          severityColor: AppColors.orange,
                        );
                      },
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 12)),
                  ],

                  if (scan.low.isNotEmpty) ...[
                    SliverToBoxAdapter(
                      child: SeveritySectionHeader(
                        title: 'LOW SEVERITY',
                        count: scan.low.length,
                        color: AppColors.yellow,
                      ),
                    ),
                    SliverList.builder(
                      itemCount: scan.low.length,
                      itemBuilder: (context, index) {
                        final item = scan.low[index];
                        return VulnerabilityCard(
                          number: (index + 1).toString().padLeft(2, '0'),
                          title: item.category,
                          description: item.detail,
                          severityColor:  AppColors.yellow,
                        );
                      },
                    ),
                    const SliverToBoxAdapter(child: SizedBox(height: 12)),
                  ],

                  if (scan.critical.isEmpty && scan.medium.isEmpty && scan.low.isEmpty)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: Center(
                          child: Text(
                            'No vulnerabilities detected in this APK 🎉',
                            style: TextStyle(
                              color:AppColors.greenColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),

                  const SliverToBoxAdapter(child: SizedBox(height: 16)),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 16, top: 8),
            child: ReportBottomActions(
              onExportPdf: () => ReportHelperService.downloadToDevice(context, scan),
              onShare: () => ReportHelperService.shareReport(context, scan),
            ),
          ),
        ],
      ),
    );
  }
}