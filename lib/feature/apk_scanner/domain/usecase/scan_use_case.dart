import 'dart:io';
import 'package:apk_scanner/core/utils/failure/server_failure.dart';
import 'package:apk_scanner/feature/apk_scanner/domain/entity/scan_entity.dart';
import 'package:apk_scanner/feature/apk_scanner/domain/repo/scan_repo.dart';
import 'package:dartz/dartz.dart';


class ScanApkUseCase {
  final ApkScannerRepository repository;

  ScanApkUseCase(this.repository);

  Future<Either<ServerFailure, ScanEntity>> call(File apkFile) {
    return repository.scanApk(apkFile);
  }
}