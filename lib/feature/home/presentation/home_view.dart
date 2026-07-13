import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'APK Scanner',
          style: TextStyle(color: Color(0xFF00FF41)),
        ),
        backgroundColor: const Color(0xFF1A1A1A),
      ),
      body: const Center(
        child: Text(
          'Welcome to APK Scanner',
          style: TextStyle(color: Color(0xFF00FF41), fontSize: 20),
        ),
      ),
    );
  }
}
