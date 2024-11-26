import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamicapp/feature/home/presentation/view/homeScreen.dart';

void main() {
  runApp(const QuranApp());
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Quran App',
          home: HomeScreen(),
        );
      },
    );
  }
}
