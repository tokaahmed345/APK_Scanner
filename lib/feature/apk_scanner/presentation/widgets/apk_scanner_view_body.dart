import 'dart:io';

import 'package:apk_scanner/core/utils/widgets/main_navigation_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';
import 'package:apk_scanner/feature/apk_scanner/presentation/cubit/scan_cubit.dart';
import 'package:apk_scanner/feature/apk_scanner/presentation/cubit/scan_state.dart';
import 'package:apk_scanner/feature/apk_scanner/presentation/widgets/scan_icon_section.dart';
import 'package:apk_scanner/feature/apk_scanner/presentation/widgets/dynamic_scan_progress.dart';

class ApkScannerViewBody extends StatefulWidget {
  final File? selectedFile;

  const ApkScannerViewBody({super.key, this.selectedFile});

  @override
  State<ApkScannerViewBody> createState() => _ApkScannerViewBodyState();
}

class _ApkScannerViewBodyState extends State<ApkScannerViewBody> {
  @override
  void initState() {
    super.initState();
    _startScanIfNeeded();
  }

  @override
  void didUpdateWidget(covariant ApkScannerViewBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedFile != oldWidget.selectedFile &&
        widget.selectedFile != null) {
      _startScanIfNeeded();
    }
  }

  void _startScanIfNeeded() {
    if (widget.selectedFile != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          context.read<ApkScannerCubit>().scanApk(widget.selectedFile!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final fileName =
        widget.selectedFile?.path.split('/').last ?? 'No File Selected';

    return BlocConsumer<ApkScannerCubit, ApkScannerState>(
      listener: (context, state) {
        if (state is ApkScannerFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.redAccent,
            ),
          );
        } else if (state is ApkScannerSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Scan completed successfully! Redirecting to Report...',
              ),
              backgroundColor: AppColors.primary,
            ),
          );

          Future.delayed(const Duration(milliseconds: 1200), () {
            if (context.mounted) {
              MainNavigationScreen.of(context)?.navigateToReport(state.scan);
            }
          });
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const ScanIconSection(),
              const SizedBox(height: 20),

              Text(
                state is ApkScannerSuccess
                    ? 'Scan Complete'
                    : (state is ApkScannerLoading
                          ? 'Scanning APK'
                          : 'Ready to Scan'),
                style: AppStyle.text20,
              ),
              const SizedBox(height: 6),
              Text(fileName, style: AppStyle.authFieldHint),
              const SizedBox(height: 30),

              if (state is ApkScannerLoading || state is ApkScannerSuccess) ...[
                DynamicScanProgressWidget(
                  isCompleted: state is ApkScannerSuccess,
                ),
                if (state is ApkScannerSuccess) ...[
                  const SizedBox(height: 24),
                  // ScanResultCard(scan: state.scan),
                ],
              ] else ...[
                const SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 36,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF141816),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.primary.withOpacity(0.2),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.04),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.security_outlined,
                          size: 42,
                          color: AppColors.primary,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'No File Selected',
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Upload an APK file from the Home tab to start analyzing permissions & potential risks.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.transparent,
                          fontSize: 13,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
