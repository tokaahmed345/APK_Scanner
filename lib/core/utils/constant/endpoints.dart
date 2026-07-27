class EndPoints {
  // شغال على الموبايل الحقيقي والـ Emulator طالما الكابل متوصل!
  static const String baseUrl = "http://localhost:5000";

  static const String scanEndpoint = "$baseUrl/scan";

  static String pdfReportEndpoint(String scanId) =>
      "$baseUrl/report/$scanId/pdf";
}
