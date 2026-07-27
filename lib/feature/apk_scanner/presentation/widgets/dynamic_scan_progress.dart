

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/styles/app_style.dart';

class DynamicScanProgressWidget extends StatefulWidget {
  final bool isCompleted;

  const DynamicScanProgressWidget({super.key, required this.isCompleted});

  @override
  State<DynamicScanProgressWidget> createState() => _DynamicScanProgressWidgetState();
}

class _DynamicScanProgressWidgetState extends State<DynamicScanProgressWidget> {
  int currentStep = 0;
  Timer? _timer;

  final List<String> steps = [
    'Extracting APK archive',
    'Parsing AndroidManifest.xml',
    'Analyzing declared permissions',
    'Decompiling DEX bytecode',
    'Detecting hardcoded secrets',
    'Scanning HTTP endpoints',
    'Checking cryptography usage',
    'Auditing data storage',
    'Reviewing exported components',
    'Generating vulnerability report',
  ];

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 1800), (timer) {
      if (currentStep < steps.length - 1) {
        setState(() {
          currentStep++;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void didUpdateWidget(covariant DynamicScanProgressWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isCompleted) {
      _timer?.cancel();
      setState(() {
        currentStep = steps.length; 
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double progress = widget.isCompleted
        ? 1.0
        : ((currentStep + 1) / steps.length).clamp(0.1, 0.95);

    int percentage = (progress * 100).toInt();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('PROGRESS', style: AppStyle.authFieldHint),
            Text(
              '$percentage%',
              style: AppStyle.text20.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: Colors.grey[800],
            color: AppColors.primary,
          ),
        ),

        const SizedBox(height: 24),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF121212),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ANALYSIS LOG', style: AppStyle.authFieldHint),
              const SizedBox(height: 16),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  bool isDone = widget.isCompleted || index < currentStep;
                  bool isInProgress = !widget.isCompleted && index == currentStep;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      children: [
                        if (isDone)
                          const Icon(Icons.check_circle, color: AppColors.primary, size: 20)
                        else if (isInProgress)
                          const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.primary,
                            ),
                          )
                        else
                          Icon(Icons.circle, color: Colors.grey[700], size: 18),

                        const SizedBox(width: 12),

                        // نص الخطوة
                        Expanded(
                          child: Text(
                            steps[index],
                            style: TextStyle(
                              color: isDone || isInProgress ? Colors.white : Colors.grey[600],
                              fontWeight: isInProgress ? FontWeight.bold : FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}