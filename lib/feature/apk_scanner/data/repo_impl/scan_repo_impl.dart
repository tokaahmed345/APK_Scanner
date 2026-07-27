import 'dart:io';
import 'package:apk_scanner/core/utils/failure/server_failure.dart';
import 'package:apk_scanner/feature/apk_scanner/data/remote_data_source/scan_remote_data_source.dart';
import 'package:apk_scanner/feature/apk_scanner/domain/entity/scan_entity.dart';
import 'package:apk_scanner/feature/apk_scanner/domain/repo/scan_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class ApkScannerRepositoryImpl implements ApkScannerRepository {
  final ApkScannerRemoteDataSource remoteDataSource;

  ApkScannerRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<ServerFailure, ScanEntity>> scanApk(File apkFile) async {
    try {
      final result = await remoteDataSource.scanApk(apkFile);
      return Right(result);
    } on DioException catch (e) {
      // 🔴 اطبع كل التفاصيل دي في الـ Console لمعرفة المشكلة الحقيقية:
      print('STATUS CODE: ${e.response?.statusCode}');
      print('RESPONSE DATA: ${e.response?.data}');
      print('ERROR MESSAGE: ${e.message}');
      return Left(ServerFailure(errMessage: e.toString()));
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}
