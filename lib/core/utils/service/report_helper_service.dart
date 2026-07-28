import 'dart:io';
import 'package:apk_scanner/core/utils/widgets/snackbar.dart';
import 'package:apk_scanner/feature/apk_scanner/domain/entity/scan_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ReportHelperService {
  static final Dio _dio = Dio();

  static Future<void> downloadToDevice(BuildContext context, ScanEntity scan) async {
    final pdfUrl = scan.pdfUrl;

    if (pdfUrl.isEmpty) {
      showSnackBarFuction(context, 'PDF URL is missing in scan response', isError: true);
      return;
    }

    try {
      Directory downloadsDir;
      if (Platform.isAndroid) {
        downloadsDir = Directory('/storage/emulated/0/Download');
        if (!await downloadsDir.exists()) {
          downloadsDir = await getExternalStorageDirectory() ?? await getApplicationDocumentsDirectory();
        }
      } else {
        downloadsDir = await getApplicationDocumentsDirectory();
      }

      final sanitizedAppName = scan.appName.isNotEmpty
          ? scan.appName.replaceAll(RegExp(r'[^\w\s\.-]'), '')
          : 'APK';
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = "${sanitizedAppName}_Report_$timestamp.pdf";
      final filePath = "${downloadsDir.path}/$fileName";

      // 3. التنزيل
      final response = await _dio.download(
        pdfUrl,
        filePath,
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        if (context.mounted) {
          showSnackBarFuction(context, 'Saved to Downloads: $fileName', isError: false);
        }
      } else {
        throw Exception('Download failed with status: ${response.statusCode}');
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBarFuction(context, 'Error downloading PDF: $e', isError: true);
      }
    }
  }

  static Future<void> shareReport(BuildContext context, ScanEntity scan) async {
    final pdfUrl = scan.pdfUrl;

    if (pdfUrl.isEmpty) {
      showSnackBarFuction(context, 'PDF URL is missing in scan response', isError: true);
      return;
    }

    try {
      final tempDir = await getTemporaryDirectory();
      final tempPath = "${tempDir.path}/${scan.appName.isNotEmpty ? scan.appName : "APK"}_Report.pdf";

      final response = await _dio.download(
        pdfUrl,
        tempPath,
        options: Options(responseType: ResponseType.bytes),
      );

      if (response.statusCode == 200) {
        await Share.shareXFiles(
          [XFile(tempPath)],
          text: 'Security Scan Report for ${scan.appName}',
        );
      } else {
        throw Exception('Failed to download PDF for sharing');
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBarFuction(context, 'Error sharing report: $e', isError: true);
      }
    }
  }

  
}