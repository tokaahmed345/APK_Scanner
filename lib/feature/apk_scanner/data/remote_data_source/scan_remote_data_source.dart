import 'dart:io';
import 'package:apk_scanner/core/utils/constant/endpoints.dart';
import 'package:apk_scanner/core/utils/service/api_service.dart';
import 'package:dio/dio.dart';

import '../models/scan_model.dart';

class ApkScannerRemoteDataSource {
  final ApiService apiService;
  ApkScannerRemoteDataSource(this.apiService);

 
Future<ScanModel> scanApk(File apkFile) async {
  
    final response = await apiService.post(
      EndPoints.scanEndpoint,
      data: {
        'apk': await MultipartFile.fromFile(
          apkFile.path,
          filename: apkFile.path.split('/').last,
        ),
      },
      isFormData: true, 
    );

    return ScanModel.fromJson(response);
  } 

}
