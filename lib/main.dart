import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/features/booking/ui/pages/booking_screen.dart';
import 'package:naz_gem/features/home/ui/pages/home_screen.dart';

import 'core/translations/app_translations.dart';
import 'features/static/on_boarding.dart';
import 'features/subscrbtions/ui/pages/subscrbtion_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(392, 803),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: TranslateWord(), // your translations
        locale: const Locale('ar'), // translations will be displayed in that locale
        fallbackLocale: const Locale('ar'),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'br'
        ),
        // home: OnBoardingScreen(),
        home: BookingScreen(),
      ),
    );
  }
}