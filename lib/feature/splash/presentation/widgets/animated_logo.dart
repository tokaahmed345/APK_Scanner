import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/feature/splash/presentation/widgets/wave_circle.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  final AnimationController waveController;

  const AnimatedLogo({super.key, required this.waveController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          WaveCircle(waveController: waveController, delay: 0.0),
          WaveCircle(waveController: waveController, delay: 0.33),
          WaveCircle(waveController: waveController, delay: 0.66),
          const ShieldBadge(),
        ],
      ),
    );
  }
}

class ShieldBadge extends StatelessWidget {
  const ShieldBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.darkSurface,
        border: Border.all(color: AppColors.primary, width: 1.5),
      ),
      child: const Icon(
        Icons.shield_outlined,
        color: AppColors.primary,
        size: 55,
      ),
    );
  }
}
