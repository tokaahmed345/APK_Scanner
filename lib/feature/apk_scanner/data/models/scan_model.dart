import '../../domain/entity/scan_entity.dart';

class VulnerabilityModel extends VulnerabilityEntity {
  const VulnerabilityModel({
    required super.category,
    required super.detail,
  });

  factory VulnerabilityModel.fromJson(Map<String, dynamic> json) {
    return VulnerabilityModel(
      category: json['category']?.toString() ?? '',
      detail: json['detail']?.toString() ?? '',
    );
  }
}

class ScanModel extends ScanEntity {
  const ScanModel({
    required super.pdfUrl,
    required super.appName,
    required super.packageName,
    required super.minSdk,
    required super.targetSdk,
    required super.versionCode,
    required super.versionName,
    required super.scanDate,
    required super.critical,
    required super.medium,
    required super.low,
  });

  factory ScanModel.fromJson(Map<String, dynamic> json) {
    final report = json['report'] as Map<String, dynamic>? ?? {};
    final appInfo = report['app_info'] as Map<String, dynamic>? ?? {};
    final severity = report['severity'] as Map<String, dynamic>? ?? {};

    List<VulnerabilityModel> parseList(dynamic list) {
      if (list is List) {
        return list.map((e) => VulnerabilityModel.fromJson(e)).toList();
      }
      return [];
    }

    return ScanModel(
      pdfUrl: json['pdf_url']?.toString() ?? '', 
      appName: appInfo['app_name']?.toString() ?? 'N/A',
      packageName: appInfo['package_name']?.toString() ?? 'N/A',
      minSdk: appInfo['min_sdk']?.toString() ?? 'N/A',
      targetSdk: appInfo['target_sdk']?.toString() ?? 'N/A',
      versionCode: appInfo['version_code']?.toString() ?? '1',
      versionName: appInfo['version_name']?.toString() ?? '1.0.0',
      scanDate: report['scan_date']?.toString().split('T').first ?? '',
      critical: parseList(severity['critical']),
      medium: parseList(severity['medium']),
      low: parseList(severity['low']),
    );
  }
}