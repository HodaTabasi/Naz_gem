import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:naz_gem/features/splash_screen.dart';
import 'package:naz_gem/main_injections.dart';
import 'core/constants/app_colors.dart';
import 'core/notification/fb_notifications.dart';
import 'core/translations/app_translations.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,
   );
  await FbNotifications.initNotifications();
  await FbNotifications.getToken();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        theme: ThemeData(primarySwatch: primary,fontFamily: 'br'),
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
