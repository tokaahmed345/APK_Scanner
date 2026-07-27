import 'dart:io';
import 'package:apk_scanner/feature/apk_scanner/domain/usecase/scan_use_case.dart';
import 'package:apk_scanner/feature/apk_scanner/presentation/cubit/scan_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApkScannerCubit extends Cubit<ApkScannerState> {
  final ScanApkUseCase scanApkUseCase;

  ApkScannerCubit(this.scanApkUseCase) : super(ApkScannerInitial());

  Future<void> scanApk(File apkFile) async {
    emit(ApkScannerLoading());

    final result = await scanApkUseCase(apkFile);

    result.fold((failure) {
      print('❌ SCAN ERROR DETAILS: ${failure.errMessage}'); // 👈 اطبع الخطأ هنا
      emit(ApkScannerFailureState(failure.errMessage));
    }, (scan) => emit(ApkScannerSuccess(scan)));
  }
}
