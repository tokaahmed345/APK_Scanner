import 'package:apk_scanner/feature/apk_scanner/presentation/widgets/apk_scanner_view_body.dart';
import 'package:flutter/material.dart';

class ApkScannerView extends StatelessWidget {
  const ApkScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ApkScannerViewBody()
    ),
     );
  }
}
