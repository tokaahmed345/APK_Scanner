
class ScanEntity  {
  final String pdfUrl; 
  final String appName;
  final String packageName;
  final String minSdk;
  final String targetSdk;
  final String versionCode;
  final String versionName;
  final String scanDate;
  final List<VulnerabilityEntity> critical;
  final List<VulnerabilityEntity> medium;
  final List<VulnerabilityEntity> low;

  const ScanEntity({
    required this.pdfUrl, 
    required this.appName,
    required this.packageName,
    required this.minSdk,
    required this.targetSdk,
    required this.versionCode,
    required this.versionName,
    required this.scanDate,
    required this.critical,
    required this.medium,
    required this.low,
  });

 
}

class VulnerabilityEntity  {
  final String category;
  final String detail;

  const VulnerabilityEntity({
    required this.category,
    required this.detail,
  });

}