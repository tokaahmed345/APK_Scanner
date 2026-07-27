
import 'package:apk_scanner/feature/apk_scanner/domain/entity/scan_entity.dart';

class ScanModel extends ScanEntity {
  ScanModel({
    required super.scanId,
    required super.pdfUrl,
    required super.appName,
    required super.packageName,
    required super.overallSeverity,
  });

  factory ScanModel.fromJson(Map<String, dynamic> json) {
    final report = json['report'] as Map<String, dynamic>;
    final appInfo = report['app_info'] as Map<String, dynamic>;
    final severity = report['severity'] as Map<String, dynamic>;

    return ScanModel(
      scanId: json['scan_id']?.toString() ?? '',
      pdfUrl: json['pdf_url']?.toString() ?? '',
      appName: appInfo['app_name']?.toString() ?? 'Unknown',
      packageName: appInfo['package_name']?.toString() ?? 'Unknown',
      overallSeverity: severity['overall_severity']?.toString() ?? 'Unknown',
    );
  }
}