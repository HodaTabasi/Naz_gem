import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:naz_gem/on_boarding.dart';
import 'package:naz_gem/translations/app_translations.dart';

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
        locale: Locale('ar'), // translations will be displayed in that locale
        fallbackLocale: Locale('ar'),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: OnBoardingScreen(),
      ),
    );
  }
}