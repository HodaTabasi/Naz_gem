import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:naz_gem/features/auth/data/repository/auth_repo_imp.dart';
import 'package:naz_gem/features/splash_screen.dart';
import 'package:naz_gem/features/subscrbtions/ui/get/subscrbtions_getx_controller.dart';
import 'package:naz_gem/main_injections.dart';

import 'core/get/general_getx_controller.dart';
import 'core/translations/app_translations.dart';
import 'features/auth/ui/get/auth_getx_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
  // runApp(const MyApp());
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
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: MainInjection(),
        translations: TranslateWord(),
        // your translations
        locale: const Locale('ar'),
        // translations will be displayed in that locale
        fallbackLocale: const Locale('ar'),
        theme: ThemeData(primarySwatch: Colors.grey, fontFamily: 'br'),
          builder:EasyLoading.init(builder: (context, child) {
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!);
          },),
        home: SplashScreen(),
        // home: BottomNavigationPage(),
      ),
    );
  }
}
