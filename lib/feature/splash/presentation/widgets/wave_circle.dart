import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class WaveCircle extends StatelessWidget {
  final AnimationController waveController;
  final double delay;

  const WaveCircle({
    super.key,
    required this.waveController,
    required this.delay,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: waveController,
      builder: (context, child) {
        final double t = (waveController.value + delay) % 1.0;
        final double scale = 0.6 + t * 0.7;
        final double opacity = (1.0 - t).clamp(0.0, 1.0);

        return Opacity(
          opacity: opacity,
          child: Transform.scale(scale: scale, child: child),
        );
      },
      child: Container(
        width: 210,
        height: 210,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }
}
