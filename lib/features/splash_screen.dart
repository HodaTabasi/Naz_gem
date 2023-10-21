import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:naz_gem/features/home/ui/pages/home_screen.dart';
import 'package:naz_gem/features/static/on_boarding.dart';

import '../navigation_bar/bottom_navigation_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool play = false;

  @override
  void initState() {
    Future.delayed(
      const Duration(milliseconds: 500),
          () {
        play = true;
        setState(() {});
        // ;
      },
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
                onEnd: () {
                  if (GetStorage().read("token") != null) {
                    Get.offAll(() => BottomNavigationPage(),
                        transition: Transition.downToUp,
                        duration: const Duration(milliseconds: 300));
                  } else {
                    Get.offAll(() => OnBoardingScreen(),
                        transition: Transition.downToUp,
                        duration: const Duration(milliseconds: 300));
                  }
                },
                height: play ? MediaQuery.of(context).size.height / 1.5.h : 0,
                left: 0,
                right: 0,
                bottom: play ? 100 : 0,
                duration: Duration(milliseconds: 1300),
                curve: Curves.easeInOut,
                child: Image.asset('assets/images/gray.png')),
          ],
        ),
      ),
    );
  }
}
