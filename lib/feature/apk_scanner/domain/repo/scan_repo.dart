import 'dart:io';
import 'package:apk_scanner/core/utils/failure/server_failure.dart';
import 'package:apk_scanner/feature/apk_scanner/domain/entity/scan_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ApkScannerRepository {
  Future<Either<ServerFailure, ScanEntity>> scanApk(File apkFile);
}