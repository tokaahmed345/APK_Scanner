class ScanEntity {
  final String scanId;
  final String pdfUrl;
  final String appName;
  final String packageName;
  final String overallSeverity;

  ScanEntity({
    required this.scanId,
    required this.pdfUrl,
    required this.appName,
    required this.packageName,
    required this.overallSeverity,
  });
}