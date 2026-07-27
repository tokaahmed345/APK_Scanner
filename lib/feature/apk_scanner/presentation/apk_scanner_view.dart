import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apk_scanner/core/utils/service_locator/service_locator.dart';
import 'package:apk_scanner/feature/apk_scanner/presentation/cubit/scan_cubit.dart'; // 👈 تأكد من موضع الـ Cubit
import 'package:apk_scanner/feature/apk_scanner/presentation/widgets/apk_scanner_view_body.dart';

class ApkScannerView extends StatelessWidget {
  final File? apkFile;

  const ApkScannerView({super.key, this.apkFile});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ApkScannerCubit>( 
      create: (context) {
        final cubit = getIt.get<ApkScannerCubit>();
        if (apkFile != null) {
          cubit.scanApk(apkFile!);
        }
        return cubit;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: ApkScannerViewBody(selectedFile: apkFile),
        ),
      ),
    );
  }
}