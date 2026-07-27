// import 'package:apk_scanner/core/utils/colors/app_colors.dart';
// import 'package:apk_scanner/feature/apk_scanner/presentation/widgets/apk_scanner_view_body.dart';
// import 'package:apk_scanner/feature/home/presentation/home_view.dart';
// import 'package:apk_scanner/feature/profile/presentation/profile_view.dart';
// import 'package:apk_scanner/feature/report/presentation/full_report_view.dart';

// import 'package:flutter/material.dart';

// class MainNavigationScreen extends StatefulWidget {
//   const MainNavigationScreen({super.key});

//   @override
//   State<MainNavigationScreen> createState() => _MainNavigationScreenState();
// }

// class _MainNavigationScreenState extends State<MainNavigationScreen> {
//   int currentIndex = 0;

//   late final List<Widget> _pages = [
//     const HomeView(),
//     const ApkScannerViewBody(),

//     const FullReportView(),
//     const ProfileView(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: IndexedStack(index: currentIndex, children: _pages),

//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: AppColors.darkSurface,
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(25),
//             topRight: Radius.circular(25),
//           ),
//           boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
//         ),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(25),
//             topRight: Radius.circular(25),
//           ),
//           child: BottomNavigationBar(
//             currentIndex: currentIndex,
//             onTap: (index) {
//               setState(() {
//                 currentIndex = index;
//               });
//             },
//             type: BottomNavigationBarType.fixed,
//             showSelectedLabels: true,
//             showUnselectedLabels: true,
//             selectedItemColor: AppColors.primary,
//             unselectedItemColor: AppColors.greyColor,
//             backgroundColor: AppColors.darkBackground,
//             items: const [
//               BottomNavigationBarItem(
//                 label: 'Home',
//                 icon: Icon(Icons.home_outlined),
//               ),
//               BottomNavigationBarItem(
//                 label: 'Scan',
//                 icon: Icon(Icons.qr_code_scanner_outlined),
//               ),
//               BottomNavigationBarItem(
//                 label: 'Report',
//                 icon: Icon(Icons.description_outlined),
//               ),
//               BottomNavigationBarItem(
//                 label: 'Profile',
//                 icon: Icon(Icons.person_2_outlined),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:apk_scanner/core/utils/colors/app_colors.dart';
import 'package:apk_scanner/core/utils/service_locator/service_locator.dart';
import 'package:apk_scanner/feature/apk_scanner/presentation/cubit/scan_cubit.dart';
import 'package:apk_scanner/feature/apk_scanner/presentation/widgets/apk_scanner_view_body.dart';
import 'package:apk_scanner/feature/home/presentation/home_view.dart';
import 'package:apk_scanner/feature/profile/presentation/profile_view.dart';
import 'package:apk_scanner/feature/report/presentation/full_report_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  static _MainNavigationScreenState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MainNavigationScreenState>();

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int currentIndex = 0;
  File? uploadedFile;
  bool isScanCompleted = false;

  void navigateToScan(File file) {
    setState(() {
      uploadedFile = file;
      isScanCompleted = false;
      currentIndex = 1;
    });
  }

  void navigateToReport() {
    setState(() {
      isScanCompleted = true;
      currentIndex = 2; 
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomeView(),
      ApkScannerViewBody(selectedFile: uploadedFile),
      const FullReportView(),
      const ProfileView(),
    ];

    return BlocProvider<ApkScannerCubit>(
      create: (context) => getIt.get<ApkScannerCubit>(),
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: pages,
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            color: AppColors.darkSurface,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (index) {
                if (index == 1 && uploadedFile == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please upload an APK file first!'),
                      backgroundColor: Colors.orangeAccent,
                    ),
                  );
                  return;
                }

                if (index == 2 && !isScanCompleted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please wait for the scan to reach 100%!'),
                      backgroundColor: Colors.orangeAccent,
                    ),
                  );
                  return;
                }

                setState(() {
                  currentIndex = index;
                });
              },
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.greyColor,
              backgroundColor: AppColors.darkBackground,
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home_outlined),
                ),
                BottomNavigationBarItem(
                  label: 'Scan',
                  icon: Icon(Icons.qr_code_scanner_outlined),
                ),
                BottomNavigationBarItem(
                  label: 'Report',
                  icon: Icon(Icons.description_outlined),
                ),
                BottomNavigationBarItem(
                  label: 'Profile',
                  icon: Icon(Icons.person_2_outlined),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}